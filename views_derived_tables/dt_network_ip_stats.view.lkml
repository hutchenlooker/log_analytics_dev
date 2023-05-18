view: dt_network_ip_stats {
  derived_table: {
    # currently not persisted. Need to create with Dataform.
    # CSA 6.15 https://github.com/GoogleCloudPlatform/security-analytics/blob/main/src/6.15/6.15.md
    sql: WITH all_ips AS
        (SELECT *,
          JSON_VALUE(json_payload.reporter) AS reporter,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.connection.src_ip), JSON_VALUE(json_payload.connection.dest_ip)) AS reporter_ip,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.connection.dest_ip), JSON_VALUE(json_payload.connection.src_ip)) AS other_ip,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.src_instance.vm_name), JSON_VALUE(json_payload.dest_instance.vm_name)) AS reporter_vm_name,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.src_vpc.vpc_name), JSON_VALUE(json_payload.dest_vpc.vpc_name)) AS reporter_vpc_name,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.dest_location.asn), JSON_VALUE(json_payload.src_location.asn)) AS external_net_asn,
          IF(JSON_VALUE(json_payload.reporter) = 'SRC', JSON_VALUE(json_payload.dest_location.country), JSON_VALUE(json_payload.src_location.country)) AS external_net_county,
          [JSON_VALUE(json_payload.connection.src_ip), JSON_VALUE(json_payload.connection.dest_ip)] AS src_dest_ip_pair
        FROM `sd-uxr-001.demo_logs._AllLogs`
        WHERE
          timestamp >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
          AND log_id = 'compute.googleapis.com/vpc_flows')
      SELECT
        ip,
        LOGICAL_OR(
          IF((offset = 0 AND reporter = 'SRC') OR (offset = 1 AND reporter = 'DEST'), True, False)) AS internal_entity,
        -- TIMESTAMP supports up to 6 digits of fractional precision, so drop any more digits to avoid parse errors
        MIN(TIMESTAMP(REGEXP_REPLACE(JSON_VALUE(json_payload.start_time), r'\.(\d{0,6})\d+(Z)?$', '.\\1\\2'))) AS ip_first_seen,
        MAX(TIMESTAMP(REGEXP_REPLACE(JSON_VALUE(json_payload.start_time), r'\.(\d{0,6})\d+(Z)?$', '.\\1\\2'))) AS ip_last_seen,
        SUM(IF(offset = 0, CAST(JSON_VALUE(json_payload.bytes_sent) AS INT64)/POWER(2, 30), 0)) AS outbound_traffic_gb,
        SUM(IF(offset = 1, CAST(JSON_VALUE(json_payload.bytes_sent) AS INT64)/POWER(2, 30), 0)) AS inbound_traffic_gb,
        ARRAY_AGG(DISTINCT
          IF((offset = 0 AND reporter = 'SRC') OR (offset = 1 AND reporter = 'DEST'), reporter_vm_name, NULL) IGNORE NULLS) AS vm_names,
        ARRAY_AGG(DISTINCT
          IF((offset = 0 AND reporter = 'SRC') OR (offset = 1 AND reporter = 'DEST'), reporter_vpc_name, NULL) IGNORE NULLS) AS vpc_names,
        ANY_VALUE(
          IF((offset = 1 AND reporter = 'SRC') OR (offset = 0 AND reporter = 'DEST'), external_net_asn, NULL)) AS external_net_asn,
        ANY_VALUE(
          IF((offset = 1 AND reporter = 'SRC') OR (offset = 0 AND reporter = 'DEST'), external_net_county, NULL)) AS external_net_county,
        ARRAY_AGG(DISTINCT
          IF((offset = 0 AND reporter = 'SRC') OR (offset = 1 AND reporter = 'DEST'), other_ip, reporter_ip) IGNORE NULLS) as connected_ips,
        COUNT(*) AS flow_count,
      FROM all_ips
      CROSS JOIN UNNEST(all_ips.src_dest_ip_pair) AS ip WITH OFFSET AS offset
      GROUP BY ip
      ORDER BY internal_entity DESC, flow_count DESC
       ;;
  }

  measure: ip_count {
    type: count
  }

  dimension: ip {
    label: " IP"
    primary_key: yes
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: ip_int_ext {
    label: " IP (with Int/Ext indicator)"
    sql: CONCAT(${ip}, ' - ', ${internal_external}) ;;
  }

  dimension: is_internal_entity {
    description: "Yes/No if IP Address is an Internal IP"
    type: yesno
    sql: ${TABLE}.internal_entity ;;
  }

  dimension: internal_external {
    sql: CASE WHEN ${is_internal_entity} THEN 'Internal' ELSE 'External' END ;;
  }

  dimension_group: ip_first_seen {
    type: time
    sql: ${TABLE}.ip_first_seen ;;
  }

  dimension_group: ip_last_seen {
    type: time
    sql: ${TABLE}.ip_last_seen ;;
  }

  measure: outbound_traffic_gb {
    group_label: "Traffic (GB)"
    value_format_name: decimal_2
    type: sum
    sql: ${TABLE}.outbound_traffic_gb ;;
    drill_fields: [ip, vm_names]
  }

  measure: inbound_traffic_gb {
    group_label: "Traffic (GB)"
    value_format_name: decimal_2
    type: sum
    sql: ${TABLE}.inbound_traffic_gb ;;
  }

  measure: total_traffic_gb {
    group_label: "Traffic (GB)"
    description: "Inbound + Outbound Traffic"
    value_format_name: decimal_2
    type: number
    sql: ${inbound_traffic_gb} + ${inbound_traffic_gb} ;;
    drill_fields: [ip,dt_network_ip_stats__vm_names.vm_names,dt_network_ip_stats__vpc_names.vpc_names,connected_ip_stats_1st_degree.connected_ips_int_ext, flow_count, inbound_traffic_gb, outbound_traffic_gb]
  }

  dimension: vm_names {
    hidden: yes
    sql: ${TABLE}.vm_names ;;
  }

  dimension: vm_names_string {
    label: "VM Names (as Array)"
    description: "Internal IP associated with this list of VMs"
    type: string
    sql: TO_JSON_STRING(${TABLE}.vm_names) ;;
  }

  dimension: vpc_names {
    hidden: yes
    sql: ${TABLE}.vpc_names ;;
  }

  dimension: vpc_names_string {
    label: "VPC Names"
    description: "Internal IP associated with this list of VPCs"
    type: string
    sql: TO_JSON_STRING(${TABLE}.vpc_names) ;;
  }

  dimension: external_net_asn {
    label: "External Net ASN"
    description: "External IP associated with this External ASN"
    type: string
    sql: ${TABLE}.external_net_asn ;;
  }

  dimension: external_net_country {
    description: "External IP associated with this Country"
    type: string
    sql: ${TABLE}.external_net_county ;;
  }

  dimension: connected_ips {
    hidden: yes
    sql: ${TABLE}.connected_ips ;;
  }

  dimension: connected_ips_string {
    view_label: "2) Connected IPs (1st Degree)"
    label: "Connected IPs (as Array)"
    description: "List of all the IPs each IP connected with"
    type: string
    sql: TO_JSON_STRING(${TABLE}.connected_ips) ;;
  }

  dimension: connected_ips_int_ext {
    #this dimension is used after the self-join of the connected ips back to the table
    # so the ${ip} refers to the connected ip after the join
    label: "Connected IPs + Int/Ext indicator"
    sql: CONCAT(${ip}, ' - ', ${internal_external}) ;;
  }

  measure: flow_count {
    type: sum
    sql: ${TABLE}.flow_count ;;
  }

}

view: dt_network_ip_stats__connected_ips {

  dimension: connected_ips {
    primary_key: yes
    label: "Connected IPs (as Rows)"
    type: string
    sql: ${TABLE} ;;
    link: {
      label: "Lookup in IP Monitoring Dashboard"
      url: "/dashboards/cloud_logging::network_ip_address_monitoring?+IP={{ value }}"
    }
  }

  measure: connection_count {
    description: "Number of IPs the IP connected to"
    #view_label: "1) IPs "
    type: count_distinct
    sql: ${TABLE} ;;
  }

  measure: connection_count_internal {
    description: "Number of Inernal IPs the IP connected to"
    #view_label: "1) IPs "
    type: count_distinct
    sql: ${TABLE} ;;
    filters: [
      connected_ip_stats_1st_degree.is_internal_entity: "Yes"
    ]
  }

  measure: connection_count_external {
    description: "Number of Inernal IPs the IP connected to"
    #view_label: "1) IPs "
    type: count_distinct
    sql: ${TABLE} ;;
    filters: [
      connected_ip_stats_1st_degree.is_internal_entity: "No"
    ]
  }

}


view: dt_network_ip_stats__vm_names {

  dimension: vm_names {
    label: "VM Names (as Rows)"
    type: string
    sql: ${TABLE} ;;
  }

  }

view: dt_network_ip_stats__vpc_names {

  dimension: vpc_names {
    label: "VPC Names (as Rows)"
    type: string
    sql: ${TABLE} ;;
  }

}

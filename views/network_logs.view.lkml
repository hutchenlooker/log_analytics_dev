include: "/views/all_logs.view"

view: network_logs {
  extends: [all_logs]


################## Main Fields #############################################################

  dimension: protocol {
    type: number

    group_label: "Connection"
    description: "The IANA protocol number"
    sql: JSON_VALUE(json_payload.connection.protocol) ;;
  }

  dimension: src_ip {
    type: string

    group_label: "Connection"
    description: "Source IP address"
    sql: JSON_VALUE(json_payload.connection.src_ip) ;;
  }

  dimension: dest_ip {
    type: string

    group_label: "Connection"
    description: "Destination IP address"
    sql: JSON_VALUE(json_payload.connection.dest_ip) ;;
  }

  dimension: src_port {
    type: string

    group_label: "Connection"
    description: "Source port"
    sql: JSON_VALUE(json_payload.connection.src_port) ;;
  }

  dimension: dest_port {
    type: string

    group_label: "Connection"
    description: "Destination port"
    sql: JSON_VALUE(json_payload.connection.dest_port) ;;
  }

  dimension: source_project_id {
    type: string

    group_label: "Instance Source"
    description: "ID of the project containing the VM"
    sql: JSON_VALUE(json_payload.src_instance.project_id) ;;
  }

  dimension: source_vm_region {
    type: string

    group_label: "Instance Source"
    description: "Region of the VM"
    sql: JSON_VALUE(json_payload.src_instance.region) ;;
  }

  dimension: source_vm_name {
    type: string

    group_label: "Instance Source"
    description: "Instance name of the VM"
    sql: JSON_VALUE(json_payload.src_instance.vm_name) ;;
  }

  dimension: source_zone {
    type: string

    group_label: "Instance Source"
    description: "Zone of the VM"
    sql: JSON_VALUE(json_payload.src_instance.zone) ;;
  }

  dimension: destination_project_id {
    type: string

    group_label: "Instance Destination"
    description: "ID of the project containing the VM"
    sql: JSON_VALUE(json_payload.dest_instance.project_id) ;;
  }

  dimension: destination_vm_region {
    type: string

    group_label: "Instance Destination"
    description: "Region of the VM"
    sql: JSON_VALUE(json_payload.dest_instance.region) ;;
  }

  dimension: destination_vm_name {
    type: string

    group_label: "Instance Destination"
    description: "Instance name of the VM"
    sql: JSON_VALUE(json_payload.dest_instance.vm_name) ;;
  }

  dimension: destination_zone {
    type: string

    group_label: "Instance Destination"
    description: "Zone of the VM"
    sql: JSON_VALUE(json_payload.dest_instance.zone) ;;
  }

  dimension: source_vpc_project_id {
    type: string

    group_label: "VPC Source"
    description: "ID of the project containing the VPC"
    sql: JSON_VALUE(json_payload.src_vpc.project_id) ;;
  }

  dimension: source_vpc_subnetwork_name {
    type: string

    group_label: "VPC Source"
    description: "Subnetwork on which the VM is operating"
    sql: JSON_VALUE(json_payload.src_vpc.subnetwork_name) ;;
  }

  dimension: source_vpc_name {
    type: string

    group_label: "VPC Source"
    description: "VPC on which the VM is operating"
    sql: JSON_VALUE(json_payload.src_vpc.vpc_name) ;;
  }

  dimension: dest_vpc_project_id {
    type: string

    group_label: "VPC Destination"
    description: "ID of the project containing the VPC"
    sql: JSON_VALUE(json_payload.dest_vpc.project_id) ;;
  }

  dimension: dest_vpc_subnetwork_name {
    type: string

    group_label: "VPC Destination"
    description: "Subnetwork on which the VM is operating"
    sql: JSON_VALUE(json_payload.dest_vpc.subnetwork_name) ;;
  }

  dimension: dest_vpc_name {
    type: string

    group_label: "VPC Destination"
    description: "VPC on which the VM is operating"
    sql: JSON_VALUE(json_payload.dest_vpc.vpc_name) ;;
  }

  dimension: asn {
    type: string

    group_label: "Location Source"
    description: "The autonomous system number (ASN) of the external network to which this endpoint belongs."
    sql: JSON_VALUE(json_payload.src_location.asn) ;;
  }

  dimension: source_city {
    type: string

    group_label: "Location Source"
    description: "City for external endpoints"
    sql: JSON_VALUE(json_payload.src_location.city) ;;
  }

  dimension: source_continent {
    type: string

    group_label: "Location Source"
    description: "Continent for external endpoints"
    sql: JSON_VALUE(json_payload.src_location.continent) ;;
  }

  dimension: source_country {
    type: string

    group_label: "Location Source"
    description: "Country for external endpoints, represented as ISO 3166-1 Alpha-3 country codes"
    sql: JSON_VALUE(json_payload.src_location.country) ;;
  }

  dimension: source_geo_region {
    type: string

    group_label: "Location Source"
    description: "Region for external endpoints"
    sql: JSON_VALUE(json_payload.src_location.region) ;;
  }

  dimension: dest_asn {
    type: string

    group_label: "Location Destination"
    description: "The autonomous system number (ASN) of the external network to which this endpoint belongs."
    sql: JSON_VALUE(json_payload.dest_location.asn) ;;
  }

  dimension: dest_city {
    type: string

    group_label: "Location Destination"
    description: "City for external endpoints"
    sql: JSON_VALUE(json_payload.dest_location.city) ;;
  }

  dimension: dest_continent {
    type: string

    group_label: "Location Destination"
    description: "Continent for external endpoints"
    sql: JSON_VALUE(json_payload.dest_location.continent) ;;
  }

  dimension: dest_country {
    type: string

    group_label: "Location Destination"
    description: "Country for external endpoints, represented as ISO 3166-1 Alpha-3 country codes"
    sql: JSON_VALUE(json_payload.dest_location.country) ;;
  }

  dimension: dest_geo_region {
    type: string

    group_label: "Location Destination"
    description: "Region for external endpoints"
    sql: JSON_VALUE(json_payload.dest_location.region) ;;
  }

  dimension: dest_cluster_location {
    type: string

    group_label: "GKE Destination"
    description: "Location of the cluster. This can be a zone or a region depending if the cluster is zonal or regional."
    sql: JSON_VALUE(json_payload.dest_gke_details.cluster.cluster_location) ;;
  }

  dimension: dest_cluster_name {
    type: string

    group_label: "GKE Destination"
    description: "GKE cluster name."
    sql: JSON_VALUE(json_payload.dest_gke_details.cluster.cluster_name) ;;
  }

  dimension: dest_pod_name {
    type: string

    group_label: "GKE Destination"
    description: "Name of the Pod"
    sql: JSON_VALUE(json_payload.dest_gke_details.pod.pod_name) ;;
  }

  dimension: dest_pod_namespace {
    type: string

    group_label: "GKE Destination"
    description: "Namespace of the Pod"
    sql: JSON_VALUE(json_payload.dest_gke_details.pod.pod_namespace) ;;
  }

  dimension: dest_service_name {
    type: string

    group_label: "GKE Destination"
    description: "Name of the Service. If there are more than two relevant Services, the field is set to a special MANY_SERVICES marker."
    sql: JSON_VALUE(json_payload.dest_gke_details.service.service_name) ;;
  }

  dimension: dest_service_namespace {
    type: string

    group_label: "GKE Destination"
    description: "Namespace of the Service"
    sql: JSON_VALUE(json_payload.dest_gke_details.service.service_namespace) ;;
  }

  dimension: src_cluster_location {
    type: string

    group_label: "GKE Source"
    description: "Location of the cluster. This can be a zone or a region depending if the cluster is zonal or regional."
    sql: JSON_VALUE(json_payload.src_gke_details.cluster.cluster_location) ;;
  }

  dimension: src_cluster_name {
    type: string

    group_label: "GKE Source"
    description: "GKE cluster name."
    sql: JSON_VALUE(json_payload.src_gke_details.cluster.cluster_name) ;;
  }

  dimension: src_pod_name {
    type: string

    group_label: "GKE Source"
    description: "Name of the Pod"
    sql: JSON_VALUE(json_payload.src_gke_details.pod.pod_name) ;;
  }

  dimension: src_pod_namespace {
    type: string

    group_label: "GKE Source"
    description: "Namespace of the Pod"
    sql: JSON_VALUE(json_payload.src_gke_details.pod.pod_namespace) ;;
  }

  dimension: src_service_name {
    type: string

    group_label: "GKE Source"
    description: "Name of the Service. If there are more than two relevant Services, the field is set to a special MANY_SERVICES marker."
    sql: JSON_VALUE(json_payload.src_gke_details.service.service_name) ;;
  }

  dimension: src_service_namespace {
    type: string

    group_label: "GKE Source"
    description: "Namespace of the Service"
    sql: JSON_VALUE(json_payload.src_gke_details.service.service_namespace) ;;
  }

  dimension: reporter {
    type: string


    description: "The side which reported the flow. Can be either SRC or DEST."
    sql: JSON_VALUE(json_payload.reporter) ;;
  }

  dimension: rtt_msec {
    type: number

    description: "Latency as measured during the time interval, for TCP flows only. The measured latency is the time elapsed between sending a SEQ and receiving a corresponding ACK. The latency result is the sum of the network RTT and any time consumed by the application."
    sql: CAST(JSON_VALUE(json_payload.rtt_msec) AS INT64) ;;
  }

  dimension: bytes_sent {
    type: number

    description: "Amount of bytes sent from the source to the destination"
    sql: CAST(JSON_VALUE(json_payload.bytes_sent) AS INT64) ;;
  }

  dimension: packets_sent {
    type: number

    description: "Number of packets sent from the source to the destination"
    sql: CAST(JSON_VALUE(json_payload.packets_sent) AS INT64) ;;
  }

  dimension: start_time {
    type: string


    description: "Timestamp (RFC 3339 date string format) of the first observed packet during the aggregated time interval."
    sql: JSON_VALUE(json_payload.start_time) ;;
  }

  dimension: end_time {
    type: string


    description: "Timestamp (RFC 3339 date string format) of the last observed packet during the aggregated time interval"
    sql: JSON_VALUE(json_payload.end_time) ;;
  }


  dimension: is_source {
    type: yesno
    sql:  SEARCH(${reporter}, "@{NETWORK_REPORTER_SOURCE}") ;;
    hidden: yes
  }

  dimension: is_destination {
    type: yesno
    sql:  SEARCH(${reporter}, "@{NETWORK_REPORTER_DESTINATION}") ;;
    hidden: yes
  }

  dimension: is_egress {
    type: yesno
    sql: (${is_source} AND (${source_vpc_name} is null or ${dest_vpc_name} is null)) ;;
  }

  dimension: is_ingress {
    type: yesno
    sql: (${is_destination} AND (${source_vpc_name} is null or ${dest_vpc_name} is null)) ;;
  }

  # Measures

  measure: total_bytes_sent {
    type: sum
    sql: ${bytes_sent} ;;
    group_label: "Bytes"
  }

  measure: total_bytes_sent_from_source {
    type: sum
    sql: ${bytes_sent} ;;
    value_format_name: decimal_0
    filters: [is_source: "yes"]
    group_label: "Bytes"
    group_item_label: "Total Sent From Source"
  }

  measure: total_bytes_egressed {
    type: sum
    sql: ${bytes_sent} ;;
    value_format_name: decimal_0
    filters: [is_egress: "yes"]
    group_label: "Bytes"
    group_item_label: "Total Egressed"
  }

  measure: total_bytes_ingressed {
    type: sum
    sql: ${bytes_sent} ;;
    value_format_name: decimal_0
    filters: [is_ingress: "yes"]
    group_label: "Bytes"
    group_item_label: "Total Ingressed"
  }

  measure: total_gigabytes_sent_from_source {
    type: number
    sql: ${total_bytes_sent_from_source} / (1024^3) ;;
    value_format_name: decimal_0
    group_label: "Gigabytes"
    group_item_label: "Total Sent From Source"
  }

  measure: total_gigabytes_egressed {
    type: number
    sql: ${total_bytes_egressed} / (1024^3) ;;
    value_format_name: decimal_0
    group_label: "Gigabytes"
    group_item_label: "Total Egressed"
  }

  measure: total_gigabytes_ingressed {
    type: number
    sql: ${total_bytes_ingressed} / (1024^3) ;;
    value_format_name: decimal_0
    group_label: "Gigabytes"
    group_item_label: "Total Ingressed"
  }

  measure: total_packets_sent_from_source {
    type: sum
    sql: ${packets_sent} ;;
    value_format_name: decimal_0
    filters: [is_source: "yes"]
  }

  measure: average_rrt_msec {
    type: average
    sql: ${rtt_msec} ;;
    value_format_name: decimal_0
  }

  measure: standard_deviation_rrt_msec {
    sql:  stddev(${rtt_msec}) ;;
    value_format_name: decimal_0
  }


  ################## Network Pulse Selector parameters #############################################################

  parameter: breakdown_selector_src {
    # hidden: yes
    description: "Use to make visualizations with dynamic date granulairty"
    type: unquoted
    default_value: "hour"
    allowed_value: {
      label: "Port"
      value: "port"
    }
    allowed_value: {
      label: "IP"
      value: "ip"
    }
    allowed_value: {
      label: "GCE instance"
      value: "gce_instance"
    }
    allowed_value: {
      label: "GCE instance project"
      value: "gce_instance_project"
    }
    allowed_value: {
      label: "VPC network"
      value: "vpc_network"
    }
    allowed_value: {
      label: "VPC network project"
      value: "vpc_network_project"
    }
    allowed_value: {
      label: "VPC subnetwork"
      value: "vpc_subnetwork"
    }
    allowed_value: {
      label: "GCP region"
      value: "gcp_region"
    }
    allowed_value: {
      label: "GCP zone"
      value: "gcp_zone"
    }
    allowed_value: {
      label: "GKE cluster"
      value: "gke_cluster"
    }
    allowed_value: {
      label: "GKE pod"
      value: "gke_pod"
    }
    allowed_value: {
      label: "GKE pod namespace"
      value: "gke_pod_namespace"
    }
    allowed_value: {
      label: "GKE service"
      value: "gke_service"
    }
    allowed_value: {
      label: "GKE service namespace"
      value: "gke_service_namespace"
    }
    allowed_value: {
      label: "Continent"
      value: "continent"
    }
    allowed_value: {
      label: "Country"
      value: "country"
    }
    allowed_value: {
      label: "Geographical region"
      value: "geographical_region"
    }
    allowed_value: {
      label: "City"
      value: "city"
    }
    allowed_value: {
      label: "ASN"
      value: "asn"
    }
  }

  dimension: breakdown_dimension_src {
    label_from_parameter: breakdown_selector_src
    # hidden: yes
    description: "For use with the 'Date Granularity' filter"
    sql:
    {% if breakdown_selector_src._parameter_value == 'port' %}
      ${src_port}
     {% elsif breakdown_selector_src._parameter_value == 'ip' %}
      ${src_ip}
     {% elsif breakdown_selector_src._parameter_value == 'gce_instance' %}
      ${source_vm_name}
     {% elsif breakdown_selector_src._parameter_value == 'gce_instance_project' %}
      ${source_project_id}
     {% elsif breakdown_selector_src._parameter_value == 'vpc_network' %}
      ${source_vpc_name}
     {% elsif breakdown_selector_src._parameter_value == 'vpc_network_project' %}
      ${source_vpc_project_id}
      {% elsif breakdown_selector_src._parameter_value == 'vpc_subnetwork' %}
      ${source_vpc_subnetwork_name}
      {% elsif breakdown_selector_src._parameter_value == 'gcp_region' %}
      ${source_vm_region}
      {% elsif breakdown_selector_src._parameter_value == 'gcp_zone' %}
      ${source_zone}
       {% elsif breakdown_selector_src._parameter_value == 'gke_cluster' %}
      ${src_cluster_name}
      {% elsif breakdown_selector_src._parameter_value == 'gke_pod' %}
      ${src_pod_name}
      {% elsif breakdown_selector_src._parameter_value == 'gke_pod_namespace' %}
      ${src_pod_namespace}
       {% elsif breakdown_selector_src._parameter_value == 'gke_service' %}
      ${src_service_name}
       {% elsif breakdown_selector_src._parameter_value == 'gke_service_namespace' %}
      ${src_service_namespace}
         {% elsif breakdown_selector_src._parameter_value == 'continent' %}
      ${source_continent}
         {% elsif breakdown_selector_src._parameter_value == 'country' %}
      ${source_country}
       {% elsif breakdown_selector_src._parameter_value == 'geographical_region' %}
      ${source_geo_region}
         {% elsif breakdown_selector_src._parameter_value == 'city' %}
      ${source_city}
        {% elsif breakdown_selector_src._parameter_value == 'asn' %}
      ${asn}
    {% else %}
      ${src_ip}
    {% endif %};;
  }

  parameter: breakdown_selector_dest {
    # hidden: yes
    description: "Use to make visualizations with dynamic dimensions"
    type: unquoted
    default_value: "hour"
    allowed_value: {
      label: "Port"
      value: "port"
    }
    allowed_value: {
      label: "IP"
      value: "ip"
    }
    allowed_value: {
      label: "GCE instance"
      value: "gce_instance"
    }
    allowed_value: {
      label: "GCE instance project"
      value: "gce_instance_project"
    }
    allowed_value: {
      label: "VPC network"
      value: "vpc_network"
    }
    allowed_value: {
      label: "VPC network project"
      value: "vpc_network_project"
    }
    allowed_value: {
      label: "VPC subnetwork"
      value: "vpc_subnetwork"
    }
    allowed_value: {
      label: "GCP region"
      value: "gcp_region"
    }
    allowed_value: {
      label: "GCP zone"
      value: "gcp_zone"
    }
    allowed_value: {
      label: "GKE cluster"
      value: "gke_cluster"
    }
    allowed_value: {
      label: "GKE pod"
      value: "gke_pod"
    }
    allowed_value: {
      label: "GKE pod namespace"
      value: "gke_pod_namespace"
    }
    allowed_value: {
      label: "GKE service"
      value: "gke_service"
    }
    allowed_value: {
      label: "GKE service namespace"
      value: "gke_service_namespace"
    }
    allowed_value: {
      label: "Continent"
      value: "continent"
    }
    allowed_value: {
      label: "Country"
      value: "country"
    }
    allowed_value: {
      label: "Geographical region"
      value: "geographical_region"
    }
    allowed_value: {
      label: "City"
      value: "city"
    }
    allowed_value: {
      label: "ASN"
      value: "asn"
    }
  }

  dimension: breakdown_dimension_dest {
    label_from_parameter: breakdown_selector_dest
    # hidden: yes
    description: "For use with the 'Date Granularity' filter"
    sql:
    {% if breakdown_selector_dest._parameter_value == 'port' %}
      ${dest_port}
     {% elsif breakdown_selector_dest._parameter_value == 'ip' %}
      ${dest_ip}
     {% elsif breakdown_selector_dest._parameter_value == 'gce_instance' %}
      ${destination_vm_name}
     {% elsif breakdown_selector_dest._parameter_value == 'gce_instance_project' %}
      ${destination_project_id}
     {% elsif breakdown_selector_dest._parameter_value == 'vpc_network' %}
      ${dest_vpc_name}
     {% elsif breakdown_selector_dest._parameter_value == 'vpc_network_project' %}
      ${dest_vpc_project_id}
      {% elsif breakdown_selector_dest._parameter_value == 'vpc_subnetwork' %}
      ${dest_vpc_subnetwork_name}
      {% elsif breakdown_selector_dest._parameter_value == 'gcp_region' %}
      ${destination_vm_region}
      {% elsif breakdown_selector_dest._parameter_value == 'gcp_zone' %}
      ${destination_zone}
       {% elsif breakdown_selector_dest._parameter_value == 'gke_cluster' %}
      ${dest_cluster_name}
      {% elsif breakdown_selector_dest._parameter_value == 'gke_pod' %}
      ${dest_pod_name}
      {% elsif breakdown_selector_dest._parameter_value == 'gke_pod_namespace' %}
      ${dest_pod_namespace}
       {% elsif breakdown_selector_dest._parameter_value == 'gke_service' %}
      ${dest_service_name}
       {% elsif breakdown_selector_dest._parameter_value == 'gke_service_namespace' %}
      ${dest_service_namespace}
         {% elsif breakdown_selector_dest._parameter_value == 'continent' %}
      ${dest_continent}
         {% elsif breakdown_selector_dest._parameter_value == 'country' %}
      ${dest_country}
       {% elsif breakdown_selector_dest._parameter_value == 'geographical_region' %}
      ${dest_geo_region}
         {% elsif breakdown_selector_dest._parameter_value == 'city' %}
      ${dest_city}
        {% elsif breakdown_selector_dest._parameter_value == 'asn' %}
      ${asn}
    {% else %}
      ${dest_ip}
    {% endif %};;
  }

  dimension: breakdown_dimension_src_dest {
    sql: CONCAT(${breakdown_dimension_src}, ' - ', ${breakdown_dimension_dest}) ;;
  }


}

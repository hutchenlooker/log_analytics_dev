# Define the database connection to be used for this model.
connection: "@{CONNECTION_NAME}"

# include all the views
include: "/views*/**/*.view"
include: "/dashboards/*.dashboard.lookml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: cloud_logging_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cloud_logging_default_datagroup

#########################################################################################################################################
###########################################################   AUDIT LOGS   ##############################################################
#########################################################################################################################################

explore: audit_logs {

  always_filter: {
    # to reduce inadverent expensive queries, default all explore queries to last 1 day (today)
    filters: [audit_logs.timestamp_date: "last 1 days"]
  }

  # this is used for Searching across columns
  sql_always_where:
  {% if audit_logs.search_filter._in_query %}
  SEARCH(audit_logs,"`{% parameter all_logs.search_filter %}`")
  {% else %}
  1=1
  {% endif %} ;;


  # Quick Start Queries

  query: all_logs_last_hour {
    description: "Show all logs for the last 1 hour"

    dimensions: [
      timestamp_time,
      severity,
      log_name,
      labels_string,
      proto_payload__request_log__resource  ]
    filters: [audit_logs.timestamp_time: "1 hours"]
    limit: 500
  }

  join: ip_to_geo_mapping {
    view_label: "7) IP Geography"
    type: left_outer
    relationship: many_to_one
    # note: this only works for IPv4 address right now, not IPv6
    sql_on:
    ${ip_to_geo_mapping.class_b} = ${audit_logs.class_b} AND
    ${audit_logs.caller_ipv4} BETWEEN ${ip_to_geo_mapping.start_ipv4_to_int64}
    and ${ip_to_geo_mapping.end_ipv4_int64};;
  }

  join: ip_stats {
    view_label: "6) IP Stats"
    type: left_outer
    relationship: many_to_one
    sql_on: ${audit_logs.proto_payload__audit_log__request_metadata__caller_ip} = ${ip_stats.caller_ip}   ;;
  }

  join: all_logs__proto_payload__request_log__line {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__request_log__line}) as all_logs__proto_payload__request_log__line ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__authorization_info {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__authorization_info}) as all_logs__proto_payload__audit_log__authorization_info ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__request_log__source_reference {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__request_log__source_reference}) as all_logs__proto_payload__request_log__source_reference ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__resource_location__current_locations {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__resource_location__current_locations}) as all_logs__proto_payload__audit_log__resource_location__current_locations ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__resource_location__original_locations {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__resource_location__original_locations}) as all_logs__proto_payload__audit_log__resource_location__original_locations ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__audiences {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__request_metadata__request_attributes__auth__audiences}) as all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__audiences ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels}) as all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__service_data__policy_delta__binding_deltas {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(JSON_QUERY_ARRAY(${audit_logs.proto_payload__audit_log__service_data__policy_delta__binding_deltas})) AS bindingDelta ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__authentication_info__service_account_delegation_info {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__authentication_info__service_account_delegation_info}) as all_logs__proto_payload__audit_log__authentication_info__service_account_delegation_info ;;
    relationship: one_to_many
  }

  join: all_logs__proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info {
    view_label: "3) Audit Log - Proto Payload"
    sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info}) as all_logs__proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info ;;
    relationship: one_to_many
  }
}

# explore: all_logs {
#   label: "Audit Logs"

#   always_filter: {
#     # to reduce inadverent expensive queries, default all explore queries to last 1 day (today)
#     filters: [all_logs.timestamp_date: "last 1 days"]
#   }

#   # this is used for Searching across columns
#   sql_always_where:
#   {% if all_logs.search_filter._in_query %}
#   SEARCH(all_logs,"`{% parameter all_logs.search_filter %}`")
#   {% else %}
#   1=1
#   {% endif %} ;;


#   # Quick Start Queries

#   query: all_logs_last_hour {
#     description: "Show all logs for the last 1 hour"

#     dimensions: [
#       timestamp_time,
#       severity,
#       log_name,
#       labels_string,
#       proto_payload__request_log__resource  ]
#     filters: [all_logs.timestamp_time: "1 hours"]
#     limit: 500
#   }

#   join: ip_to_geo_mapping {
#     view_label: "7) IP Geography"
#     type: left_outer
#     relationship: many_to_one
#     # note: this only works for IPv4 address right now, not IPv6
#     sql_on:
#     ${ip_to_geo_mapping.class_b} = ${audit_logs.class_b} AND
#     ${audit_logs.caller_ipv4} BETWEEN ${ip_to_geo_mapping.start_ipv4_to_int64}
#     and ${ip_to_geo_mapping.end_ipv4_int64};;
#   }

#   join: ip_stats {
#     view_label: "6) IP Stats"
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${audit_logs.proto_payload__audit_log__request_metadata__caller_ip} = ${ip_stats.caller_ip}   ;;
#   }

#   join: all_logs__proto_payload__request_log__line {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__request_log__line}) as all_logs__proto_payload__request_log__line ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__authorization_info {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__authorization_info}) as all_logs__proto_payload__audit_log__authorization_info ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__request_log__source_reference {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__request_log__source_reference}) as all_logs__proto_payload__request_log__source_reference ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__resource_location__current_locations {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__resource_location__current_locations}) as all_logs__proto_payload__audit_log__resource_location__current_locations ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__resource_location__original_locations {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__resource_location__original_locations}) as all_logs__proto_payload__audit_log__resource_location__original_locations ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__audiences {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__request_metadata__request_attributes__auth__audiences}) as all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__audiences ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels}) as all_logs__proto_payload__audit_log__request_metadata__request_attributes__auth__access_levels ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__service_data__policy_delta__binding_deltas {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(JSON_QUERY_ARRAY(${audit_logs.proto_payload__audit_log__service_data__policy_delta__binding_deltas})) AS bindingDelta ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__authentication_info__service_account_delegation_info {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__authentication_info__service_account_delegation_info}) as all_logs__proto_payload__audit_log__authentication_info__service_account_delegation_info ;;
#     relationship: one_to_many
#   }

#   join: all_logs__proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info {
#     view_label: "3) Audit Log - Proto Payload"
#     sql: LEFT JOIN UNNEST(${audit_logs.proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info}) as all_logs__proto_payload__audit_log__policy_violation_info__org_policy_violation_info__violation_info ;;
#     relationship: one_to_many
#   }
# }

explore: impossible_traveler {
  hidden: yes
}

explore: unusual_api_usage {
  hidden: yes
  label: "Abnormal API Usage"
  view_label: "0) Normal API Usage"
  description: "Compare API usage against historical norms to find abnormal usage patterns"

  always_filter: {
    filters: [unusual_api_usage.date: "last 1 days"]
    filters: [unusual_api_usage.historical_date: "last 90 days"]
    filters: [unusual_api_usage.standard_deviation: "3"]
    filters: [unusual_api_usage.exceeds_threshold: "Yes"]
  }

  join: audit_logs  {
    relationship: one_to_many
    sql_on: ${unusual_api_usage.principal_email} =  ${audit_logs.proto_payload__audit_log__authentication_info__principal_email}
      AND ${unusual_api_usage.history_date} = ${audit_logs.timestamp_date} ;;
  }
}


#########################################################################################################################################
###########################################################   NETWORK LOGS   ############################################################
#########################################################################################################################################

explore: network_logs {
  #fields: [network_logs*,]


  always_filter: {
    # always filter on VPC flow logs
    filters: [network_logs.log_id: "compute.googleapis.com/vpc_flows"]
    # to reduce inadverent expensive queries, default all explore queries to last 1 day (today)
    filters: [network_logs.timestamp_date: "last 1 days"]
  }

  join: ip_details_src {
    from: dt_network_ip_stats
    view_label: "4) IP Details - Source"
    sql_on: ${network_logs.src_ip} = ${ip_details_src.ip} ;;
    relationship: many_to_one
  }

  join: ip_details_dest {
    from: dt_network_ip_stats
    view_label: "5) IP Details - Dest"
    sql_on: ${network_logs.dest_ip} = ${ip_details_dest.ip} ;;
    relationship: many_to_one
  }
}

explore: dt_network_ip_stats {
  label: "Network Logs - IP Details"
  view_label: "Network Logs - IP Details"
}

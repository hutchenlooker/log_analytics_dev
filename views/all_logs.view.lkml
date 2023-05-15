view: all_logs {
  # DATASET_ID and LOG_TABLE_NAME are constants set in the manifest file
  sql_table_name: `@{PROJECT_ID}.@{DATASET_ID}.@{LOG_TABLE_NAME}` ;;

  # parameters

  parameter: search_filter {
    view_label: "1) All Logs"
    # used for searching across columns in the table
    suggestable: no
    type: unquoted
  }

  parameter: date_granularity {
    hidden: yes
    view_label: "1) All Logs"
    description: "Use to make visualizations with dynamic date granulairty"
    type: unquoted
    default_value: "hour"
    allowed_value: {
      label: "Hour"
      value: "hour"
    }
    allowed_value: {
      label: "Hour - 6"
      value: "hour_6"
      }
    allowed_value: {
      label: "Day"
      value: "day"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
  }

  dimension: date {
    hidden: yes
    view_label: "1) All Logs"
    description: "For use with the 'Date Granularity' filter"
    sql:
    {% if date_granularity._parameter_value == 'hour' %}
      ${timestamp_hour}
     {% elsif date_granularity._parameter_value == 'hour_6' %}
      ${timestamp_hour6}
    {% elsif date_granularity._parameter_value == 'day' %}
      ${timestamp_date}
    {% elsif date_granularity._parameter_value == 'week' %}
      ${timestamp_week}
    {% else %}
      ${timestamp_date}
    {% endif %};;
  }


################## MAIN/REQUIRED FIELDS #############################################################

  dimension: log_id {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.log_id ;;
  }

  dimension: log_type {
    description: "Cleaner version of Log ID"
    view_label: "1) All Logs"
    sql: REPLACE(${log_id}, '.googleapis.com/', ' - ') ;;

  }

  dimension: log_name {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.log_name ;;
  }

  dimension: insert_id {
    view_label: "1) All Logs"
    description: "A unique identifier for the log entry."
    type: string
    sql: ${TABLE}.insert_id ;;
  }

  dimension: resource__labels {
    view_label: "1) All Logs"
    hidden: yes
    type: string
    sql: ${TABLE}.resource.labels ;;
    group_label: "Resource"
    group_item_label: "Labels"
  }

  dimension: resource__labels_string {
    view_label: "1) All Logs"
    # Looker currently cannot display the JSON datatype. So need to convert it to STRING to display.
    type: string
    sql: TO_JSON_STRING(${resource__labels}) ;;
  }

  dimension: resource__type {
    type: string
    sql: ${TABLE}.resource.type ;;
    view_label: "1) All Logs"
  }

  dimension: severity {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: severity_number {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.severity_number ;;
  }

  dimension_group: timestamp {
    view_label: "1) All Logs"
    type: time
    timeframes: [
      raw,
      time,
      millisecond,
      minute,
      minute10,
      minute15,
      minute30,
      hour_of_day,
      hour,
      hour6,
      hour12,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: min_timestamp {
    hidden: yes
    type: date_time
    sql: MIN(${timestamp_raw}) ;;
  }

  measure: max_timestamp {
    hidden: yes
    type: date_time
    sql: MAX(${timestamp_raw}) ;;
  }

  dimension: timestamp_unix_nanos {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.timestamp_unix_nanos ;;
  }


################################## HTTP Request #############################################

  dimension: http_request__cache_fill_bytes {
    type: number
    sql: ${TABLE}.http_request.cache_fill_bytes ;;
    view_label: "2) HTTP Request"
    group_item_label: "Cache Fill Bytes"
  }

  dimension: http_request__cache_hit {
    type: yesno
    sql: ${TABLE}.http_request.cache_hit ;;
    view_label: "2) HTTP Request"
    group_item_label: "Cache Hit"
  }

  dimension: http_request__cache_lookup {
    type: yesno
    sql: ${TABLE}.http_request.cache_lookup ;;
    view_label: "2) HTTP Request"
    group_item_label: "Cache Lookup"
  }

  dimension: http_request__cache_validated_with_origin_server {
    type: yesno
    sql: ${TABLE}.http_request.cache_validated_with_origin_server ;;
    view_label: "2) HTTP Request"
    group_item_label: "Cache Validated with Origin Server"
  }

  dimension: http_request__latency__nanos {
    type: number
    sql: ${TABLE}.http_request.latency.nanos ;;
    view_label: "2) HTTP Request"
    group_label: "HTTP Request Latency"
    group_item_label: "Nanos"
  }

  dimension: http_request__latency__seconds {
    type: number
    sql: ${TABLE}.http_request.latency.seconds ;;
    view_label: "2) HTTP Request"
    group_label: "HTTP Request Latency"
    group_item_label: "Seconds"
  }

  dimension: http_request__protocol {
    type: string
    sql: ${TABLE}.http_request.protocol ;;
    view_label: "2) HTTP Request"
    group_item_label: "Protocol"
  }

  dimension: http_request__referer {
    type: string
    sql: ${TABLE}.http_request.referer ;;
    view_label: "2) HTTP Request"
    group_item_label: "Referer"
  }

  dimension: http_request__remote_ip {
    type: string
    sql: ${TABLE}.http_request.remote_ip ;;
    view_label: "2) HTTP Request"
    group_item_label: "Remote IP"
  }

  dimension: http_request__request_method {
    type: string
    sql: ${TABLE}.http_request.request_method ;;
    view_label: "2) HTTP Request"
    group_item_label: "Request Method"
  }

  dimension: http_request__request_size {
    type: number
    sql: ${TABLE}.http_request.request_size ;;
    view_label: "2) HTTP Request"
    group_item_label: "Request Size"
  }

  dimension: http_request__request_url {
    type: string
    sql: ${TABLE}.http_request.request_url ;;
    view_label: "2) HTTP Request"
    group_item_label: "Request URL"
  }

  dimension: http_request__response_size {
    type: number
    sql: ${TABLE}.http_request.response_size ;;
    view_label: "2) HTTP Request"
    group_item_label: "Response Size"
  }

  dimension: http_request__server_ip {
    type: string
    sql: ${TABLE}.http_request.server_ip ;;
    view_label: "2) HTTP Request"
    group_item_label: "Server IP"
  }

  dimension: http_request__status {
    type: number
    sql: ${TABLE}.http_request.status ;;
    view_label: "2) HTTP Request"
    group_item_label: "Status"
  }

  dimension: http_request__user_agent {
    type: string
    sql: ${TABLE}.http_request.user_agent ;;
    view_label: "2) HTTP Request"
    group_item_label: "User Agent"
  }

###############################################################################

  dimension: json_payload {
    hidden: yes
    type: string
    sql: ${TABLE}.json_payload ;;
  }

  dimension: json_payload_string {
    view_label: "1) All Logs"
    label: "JSON Payload"
    # Looker currently cannot display the JSON datatype. So need to convert it to STRING to display.
    type: string
    sql: TO_JSON_STRING(${json_payload}) ;;
  }

  dimension: labels {
    hidden: yes
    type: string
    sql: ${TABLE}.labels ;;
  }

  dimension: labels_string {
    view_label: "1) All Logs"
    label: "Labels"
    # Looker currently cannot display the JSON datatype. So need to convert it to STRING to display.
    type: string
    sql: TO_JSON_STRING(${labels}) ;;
  }

  dimension: operation__first {
    view_label: "1) All Logs"
    type: yesno
    sql: ${TABLE}.operation.first ;;
    group_label: "Operation"
    group_item_label: "First"
  }

  dimension: operation__id {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.operation.id ;;
    group_label: "Operation"
    group_item_label: "ID"
  }

  dimension: operation__last {
    view_label: "1) All Logs"
    type: yesno
    sql: ${TABLE}.operation.last ;;
    group_label: "Operation"
    group_item_label: "Last"
  }

  dimension: operation__producer {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.operation.producer ;;
    group_label: "Operation"
    group_item_label: "Producer"
  }

  dimension_group: receive_timestamp {
    view_label: "1) All Logs"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receive_timestamp ;;
  }

  dimension: receive_timestamp_unix_nanos {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.receive_timestamp_unix_nanos ;;
  }

  dimension: source_location__file {
    view_label: "1) All Logs"
    group_label: "Source Location"
    type: string
    sql: ${TABLE}.source_location.file ;;
    group_item_label: "File"
  }

  dimension: source_location__function {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.source_location.function ;;
    group_label: "Source Location"
    group_item_label: "Function"
  }

  dimension: source_location__line {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.source_location.line ;;
    group_label: "Source Location"
    group_item_label: "Line"
  }

  dimension: span_id {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.span_id ;;
  }

  dimension: split__index {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.split.index ;;
    group_label: "Split"
    group_item_label: "Index"
  }

  dimension: split__total_splits {
    view_label: "1) All Logs"
    type: number
    sql: ${TABLE}.split.total_splits ;;
    group_label: "Split"
    group_item_label: "Total Splits"
  }

  dimension: split__uid {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.split.uid ;;
    group_label: "Split"
    group_item_label: "Uid"
  }

  dimension: text_payload {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.text_payload ;;
  }

  dimension: trace {
    view_label: "1) All Logs"
    type: string
    sql: ${TABLE}.trace ;;
  }

  dimension: trace_sampled {
    view_label: "1) All Logs"
    type: yesno
    sql: ${TABLE}.trace_sampled ;;
  }

############# Derived Fields ############

  dimension: is_audit_log {
    view_label: "1) All Logs"
    hidden: yes
    description: "Use to filter on Audit Logs"
    type: yesno
    sql:  log_name LIKE "%cloudaudit.googleapis.com%";;
  }

  dimension: is_load_balancer_log {
    view_label: "1) All Logs"
    hidden: yes
    type: yesno
    sql: ${resource__type} = 'http_load_balancer' ;;
  }

  # Measures

  measure: count {
    view_label: "1) All Logs"
    label: "Event Count"
    type: count
  }

}

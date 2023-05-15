- dashboard: principal_lookup
  title: Principal Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 9X8S88dtaUzQpRwRX9SbxB
  elements:
  - title: IPs Used - Last 30 Days
    name: IPs Used - Last 30 Days
    model: cloud_logging
    explore: audit_logs
    type: looker_grid
    fields: [audit_logs.proto_payload__audit_log__request_metadata__caller_ip, audit_logs.min_timestamp,
      audit_logs.max_timestamp, audit_logs.count]
    filters: {}
    sorts: [audit_logs.max_timestamp desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      audit_logs.min_timestamp: First Used
      audit_logs.max_timestamp: Last Used
    series_cell_visualizations: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#29bff3",
        font_color: !!null '', color_application: {collection_id: create-a-color-collection,
          palette_id: create-a-color-collection-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Principal Email: audit_logs.proto_payload__audit_log__authentication_info__principal_email
      Date: audit_logs.timestamp_date
    row: 2
    col: 7
    width: 17
    height: 8
  - title: Services Used
    name: Services Used
    model: cloud_logging
    explore: audit_logs
    type: looker_pie
    fields: [audit_logs.proto_payload__audit_log__service_name, audit_logs.count]
    filters: {}
    sorts: [audit_logs.count desc 0]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Principal Email: audit_logs.proto_payload__audit_log__authentication_info__principal_email
      Date: audit_logs.timestamp_date
    row: 2
    col: 0
    width: 7
    height: 8
  - title: Historical API Usage
    name: Historical API Usage
    model: cloud_logging
    explore: audit_logs
    type: looker_column
    fields: [audit_logs.timestamp_date, audit_logs.count, audit_logs.method_count]
    fill_fields: [audit_logs.timestamp_date]
    filters:
      audit_logs.count: NOT NULL
    sorts: [audit_logs.timestamp_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.count, id: audit_logs.count,
            name: Event Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: audit_logs.total_methods_used, id: audit_logs.total_methods_used,
            name: Total Methods Used}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: audit_logs.method_count
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      audit_logs.total_methods_used: scatter
      audit_logs.method_count: scatter
    series_labels:
      audit_logs.method_count: Methods Used
    reference_lines: []
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Principal Email: audit_logs.proto_payload__audit_log__authentication_info__principal_email
      Date: audit_logs.timestamp_date
    row: 12
    col: 10
    width: 14
    height: 8
  - title: Recent API Usage
    name: Recent API Usage
    model: cloud_logging
    explore: audit_logs
    type: looker_grid
    fields: [audit_logs.timestamp_date, audit_logs.proto_payload__audit_log__method_name,
      audit_logs.count]
    filters:
      audit_logs.timestamp_date: 7 days
    sorts: [audit_logs.count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      audit_logs.proto_payload__audit_log__method_name: Method
      audit_logs.proto_payload__audit_log__authentication_info__principal_email: Principal
        Email
      audit_logs.timestamp_date: Date
    series_cell_visualizations:
      audit_logs.count:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: false
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.count, id: audit_logs.count,
            name: Event Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: audit_logs.total_methods_used, id: audit_logs.total_methods_used,
            name: Total Methods Used}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: audit_logs.total_methods_used
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_column_widths:
      audit_logs.timestamp_date: 113
      audit_logs.proto_payload__audit_log__method_name: 452
    note_state: collapsed
    note_display: above
    note_text: Last 7 Days
    listen:
      Principal Email: audit_logs.proto_payload__audit_log__authentication_info__principal_email
    row: 12
    col: 0
    width: 10
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h2","children":[{"text":"API Usage"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 10
    col: 0
    width: 24
    height: 2
  - title: email
    name: email
    model: cloud_logging
    explore: audit_logs
    type: single_value
    fields: [audit_logs.proto_payload__audit_log__authentication_info__principal_email]
    filters: {}
    sorts: [audit_logs.proto_payload__audit_log__authentication_info__principal_email]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Principal Email: audit_logs.proto_payload__audit_log__authentication_info__principal_email
      Date: audit_logs.timestamp_date
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Principal Email
    title: Principal Email
    type: field_filter
    default_value: hutz@google.com
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cloud_logging
    explore: audit_logs
    listens_to_filters: []
    field: audit_logs.proto_payload__audit_log__authentication_info__principal_email
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: cloud_logging
    explore: audit_logs
    listens_to_filters: []
    field: audit_logs.timestamp_date

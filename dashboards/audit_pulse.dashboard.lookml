- dashboard: audit_pulse
  title: Audit Pulse
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: z7KCrybLnoLR1Fs8L0owcO
  elements:
  - title: Services
    name: Services
    model: cloud_logging
    explore: audit_logs
    type: single_value
    fields: [audit_logs.service_count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date Filter: audit_logs.timestamp_date
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 0
    col: 0
    width: 6
    height: 3
  - title: IPs
    name: IPs
    model: cloud_logging
    explore: audit_logs
    type: single_value
    fields: [audit_logs.ip_count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Filter: audit_logs.timestamp_date
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Principals
    name: Principals
    model: cloud_logging
    explore: audit_logs
    type: single_value
    fields: [audit_logs.principal_count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Filter: audit_logs.timestamp_date
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Methods
    name: Methods
    model: cloud_logging
    explore: audit_logs
    type: single_value
    fields: [audit_logs.method_count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Filter: audit_logs.timestamp_date
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Methods Trend
    name: Methods Trend
    model: cloud_logging
    explore: audit_logs
    type: looker_line
    fields: [audit_logs.method_count, audit_logs.date]
    filters: {}
    sorts: [audit_logs.date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.total_methods_used,
            id: audit_logs.total_methods_used, name: Total Methods Used}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    title_hidden: true
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 3
    col: 18
    width: 6
    height: 3
  - title: Services Trend
    name: Services Trend
    model: cloud_logging
    explore: audit_logs
    type: looker_line
    fields: [audit_logs.service_count, audit_logs.date]
    filters: {}
    sorts: [audit_logs.date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.total_methods_used,
            id: all_logs.total_methods_used, name: Total Methods Used}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    title_hidden: true
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 3
    col: 0
    width: 6
    height: 3
  - title: IP Trend
    name: IP Trend
    model: cloud_logging
    explore: audit_logs
    type: looker_line
    fields: [audit_logs.ip_count, audit_logs.date]
    filters: {}
    sorts: [audit_logs.date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.total_methods_used,
            id: audit_logs.total_methods_used, name: Total Methods Used}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    title_hidden: true
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 3
    col: 6
    width: 6
    height: 3
  - title: Principals Trend
    name: Principals Trend
    model: cloud_logging
    explore: audit_logs
    type: looker_line
    fields: [audit_logs.principal_count, audit_logs.date]
    filters: {}
    sorts: [audit_logs.date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: audit_logs.total_methods_used,
            id: audit_logs.total_methods_used, name: Total Methods Used}], showLabels: false,
        showValues: false, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    title_hidden: true
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 3
    col: 12
    width: 6
    height: 3
  - title: Top IP Activity
    name: Top IP Activity
    model: cloud_logging
    explore: audit_logs
    type: looker_bar
    fields: [audit_logs.proto_payload__audit_log__request_metadata__caller_ip, audit_logs.service_count,
      audit_logs.method_count, audit_logs.count]
    filters:
      audit_logs.proto_payload__audit_log__request_metadata__caller_ip: "-NULL,-private"
      audit_logs.is_system_or_service_account: 'No'
    sorts: [audit_logs.count desc]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: false
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
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: audit_logs.service_count,
            id: audit_logs.service_count, name: Service Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: bottom, series: [{axisId: audit_logs.method_count, id: audit_logs.method_count,
            name: Method Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: audit_logs.method_count
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      audit_logs.method_count: scatter
    series_colors:
      audit_logs.method_count: "#93CF6C"
    series_labels: {}
    defaults_version: 1
    hidden_fields: [audit_logs.count]
    hidden_points_if_no: []
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    note_state: collapsed
    note_display: hover
    note_text: Number of Services accessed by IP and Methods executed by IP
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 6
    col: 0
    width: 12
    height: 13
  - title: Top Principals by Service
    name: Top Principals by Service
    model: cloud_logging
    explore: audit_logs
    type: looker_donut_multiples
    fields: [audit_logs.proto_payload__audit_log__authentication_info__principal_email,
      audit_logs.proto_payload__audit_log__service_name, audit_logs.count]
    pivots: [audit_logs.proto_payload__audit_log__service_name]
    filters:
      audit_logs.is_system_or_service_account: 'No'
      audit_logs.proto_payload__audit_log__authentication_info__principal_email: "-NULL"
    sorts: [audit_logs.proto_payload__audit_log__service_name, audit_logs.count desc 0]
    limit: 9
    column_limit: 50
    show_value_labels: false
    font_size: 12
    charts_across: 3
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    series_colors:
      container - audit_logs.count: "#93CF6C"
      cloudsql - audit_logs.count: "#FFE663"
      cloudasset - audit_logs.count: "#5DC370"
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
    hidden_pivots: {}
    listen:
      Date Filter: audit_logs.timestamp_date
      Date Granularity: audit_logs.date_granularity
      Service(s): audit_logs.proto_payload__audit_log__service_name
    row: 6
    col: 12
    width: 12
    height: 13
  filters:
  - name: Date Filter
    title: Date Filter
    type: field_filter
    default_value: 7 day
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
  - name: Date Granularity
    title: Date Granularity
    type: field_filter
    default_value: hour
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: cloud_logging
    explore: audit_logs
    listens_to_filters: []
    field: audit_logs.date_granularity
  - name: Service(s)
    title: Service(s)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cloud_logging
    explore: audit_logs
    listens_to_filters: []
    field: audit_logs.proto_payload__audit_log__service_name
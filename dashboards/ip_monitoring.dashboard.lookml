- dashboard: network_ip_address_monitoring
  title: Network IP Address Monitoring
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3XDt5BI8IyRV4dwM3e9j6f
  elements:
  - title: Connected IPs
    name: Connected IPs
    model: cloud_logging
    explore: dt_network_ip_stats
    type: sankey
    fields: [dt_network_ip_stats.ip, dt_network_ip_stats.total_traffic_gb, connected_ip_stats_1st_degree.connected_ips_int_ext]
    filters: {}
    sorts: [dt_network_ip_stats.total_traffic_gb desc]
    limit: 35
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_range: ["#29bff3", "#93afbb", "#0872a8", "#6d6d6d"]
    label_type: name
    show_null_points: true
    defaults_version: 0
    note_state: collapsed
    note_display: hover
    note_text: Shows Top 35 IPs sorted by Total Traffic GB sent (Inbound & Outbound)
    listen:
      " IP": dt_network_ip_stats.ip
    row: 2
    col: 9
    width: 15
    height: 15
  - title: Internal Connections
    name: Internal Connections
    model: cloud_logging
    explore: dt_network_ip_stats
    type: single_value
    fields: [dt_network_ip_stats__connected_ips.connection_count_internal, dt_network_ip_stats__connected_ips.connection_count]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: of connections, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_of_column_sum, table_calculation: of_connections,
        args: [dt_network_ip_stats__connected_ips.connection_count], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [dt_network_ip_stats__connected_ips.connection_count_internal],
        calculation_type: percent_of_previous, category: table_calculation, based_on: dt_network_ip_stats__connected_ips.connection_count_internal,
        label: Percent of previous - 2) Connected IPs (1st Degree) Connection Count
          Internal, source_field: dt_network_ip_stats__connected_ips.connection_count_internal,
        table_calculation: percent_of_previous_2_connected_ips_1st_degree_connection_count_internal,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: "${dt_network_ip_stats__connected_ips.connection_count_internal}\
          \ / ${dt_network_ip_stats__connected_ips.connection_count}", label: of connections,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        table_calculation: of_connections_1, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
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
    stacking: normal
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
    y_axes: [{label: '', orientation: left, series: [{axisId: External - dt_network_ip_stats__connected_ips.connection_count,
            id: External - dt_network_ip_stats__connected_ips.connection_count, name: External},
          {axisId: Internal - dt_network_ip_stats__connected_ips.connection_count,
            id: Internal - dt_network_ip_stats__connected_ips.connection_count, name: Internal}],
        showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '18'
    series_types: {}
    series_colors:
      External - dt_network_ip_stats__connected_ips.connection_count: "#170658"
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [dt_network_ip_stats__connected_ips.connection_count]
    listen:
      " IP": dt_network_ip_stats.ip
    row: 2
    col: 0
    width: 4
    height: 4
  - title: External Connections
    name: External Connections
    model: cloud_logging
    explore: dt_network_ip_stats
    type: single_value
    fields: [dt_network_ip_stats__connected_ips.connection_count_external, dt_network_ip_stats__connected_ips.connection_count]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: of connections, value_format: !!null '',
        value_format_name: percent_1, calculation_type: percent_of_column_sum, table_calculation: of_connections,
        args: [dt_network_ip_stats__connected_ips.connection_count], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: "${dt_network_ip_stats__connected_ips.connection_count_external}\
          \ / ${dt_network_ip_stats__connected_ips.connection_count}", label: of connections,
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        table_calculation: of_connections_1, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
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
    stacking: normal
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
    y_axes: [{label: '', orientation: left, series: [{axisId: External - dt_network_ip_stats__connected_ips.connection_count,
            id: External - dt_network_ip_stats__connected_ips.connection_count, name: External},
          {axisId: Internal - dt_network_ip_stats__connected_ips.connection_count,
            id: Internal - dt_network_ip_stats__connected_ips.connection_count, name: Internal}],
        showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '18'
    series_types: {}
    series_colors:
      External - dt_network_ip_stats__connected_ips.connection_count: "#170658"
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [dt_network_ip_stats__connected_ips.connection_count]
    listen:
      " IP": dt_network_ip_stats.ip
    row: 2
    col: 4
    width: 5
    height: 4
  - title: Associated VMs
    name: Associated VMs
    model: cloud_logging
    explore: dt_network_ip_stats
    type: looker_grid
    fields: [dt_network_ip_stats__vm_names.vm_names]
    filters: {}
    sorts: [dt_network_ip_stats__vm_names.vm_names]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      dt_network_ip_stats__vm_names.vm_names: Associated VMs
    defaults_version: 1
    listen:
      " IP": dt_network_ip_stats.ip
    row: 6
    col: 4
    width: 5
    height: 5
  - title: Associated VPCs
    name: Associated VPCs
    model: cloud_logging
    explore: dt_network_ip_stats
    type: looker_grid
    fields: [dt_network_ip_stats__vpc_names.vpc_names]
    filters: {}
    sorts: [dt_network_ip_stats__vpc_names.vpc_names]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      dt_network_ip_stats__vm_names.vm_names: Associated VMs
    defaults_version: 1
    listen:
      " IP": dt_network_ip_stats.ip
    row: 6
    col: 0
    width: 4
    height: 5
  - title: IP
    name: IP
    model: cloud_logging
    explore: dt_network_ip_stats
    type: single_value
    fields: [dt_network_ip_stats.ip_int_ext]
    filters: {}
    sorts: [dt_network_ip_stats.ip_int_ext]
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
      " IP": dt_network_ip_stats.ip
    row: 0
    col: 0
    width: 24
    height: 2
  - title: IP Tree
    name: IP Tree
    model: cloud_logging
    explore: dt_network_ip_stats
    type: marketplace_viz_collapsible_tree::collapsible_tree-marketplace
    fields: [dt_network_ip_stats.ip, connected_ip_stats_1st_degree.connected_ips_int_ext,
      dt_network_ip_stats__connected_ips_2nd.connected_ips]
    filters: {}
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_with_children: "#36c1b3"
    color_empty: "#fff"
    defaults_version: 0
    hidden_pivots: {}
    listen:
      " IP": dt_network_ip_stats.ip
    row: 17
    col: 9
    width: 15
    height: 17
  filters:
  - name: " IP"
    title: " IP"
    type: field_filter
    default_value: 10.44.5.7
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cloud_logging
    explore: dt_network_ip_stats
    listens_to_filters: []
    field: dt_network_ip_stats.ip

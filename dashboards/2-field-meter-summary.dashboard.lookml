- dashboard: 2_field_meter_summary
  title: "(2) Field Meter Summary"
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 10 seconds
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n\theight: 54px; \n\tbackground-color: #fff; \n\tcolor:\
      \ #5f6368; \n\tborder-radius: 54px; \n\tborder: solid 1px #5f6368; \n\tfont-family:\
      \ Google Sans,Noto Sans,Noto Sans JP,Noto Sans KR,Noto Naskh Arabic,Noto Sans\
      \ Thai,Noto Sans Hebrew,Noto Sans Bengali,sans-serif; \n\tpadding: 12px;\">\n\
      <span style=\"\n\twidth: 38px;\n\theight: 38px; \n\tborder-radius: 60px; \n\t\
      background-color: white; \n\tdisplay:table-cell; \n\tvertical-align:middle;\
      \ \n\ttext-align:center; \n\tmargin-right: 12px; \n\tfloat: left;\">\n<img width=\"\
      16px\" src=\"https://storage.googleapis.com/brechtv/Looker_Favicon_32x32%403x.png\"\
      />\n</span>\n\n<span style=\"\n\tpadding: 4px; \n\tfloat:left;\">\n\t<h1 style=\"\
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tField Meter\
      \ Summary\n\t</h1>\n</span>\n<span style=\"padding: 4px; float:right;\">\n\t\
      <a style=\"background-color: #fff; color: #5f6368; padding: 5px 10px;\" href=\"\
      https://badalio.cloud.looker.com/boards/3\">Home</a>\n\t<a style=\"background-color:\
      \ #fff; color: #5f6368; padding: 5px 10px;\" href=\"https://badalio.cloud.looker.com/explore/facilities-demo/measurements\"\
      >Explore</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding:\
      \ 5px 10px;\" href=\"https://badalio.ca.looker.com/dashboards-next/8?Timestamp+Date=7+day\"\
      >Go Back to Facilities Overview</a>\n</span>\n\n<div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Total Density
    name: Total Density
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.total_value, measurements.dynamic_timeframe, measurements.property_measured,
      paths.field_meter_tag]
    pivots: [measurements.property_measured, paths.field_meter_tag]
    filters:
      measurements.property_measured: density
    sorts: [measurements.property_measured, measurements.dynamic_timeframe, paths.field_meter_tag]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Density Unit Conversion: measurements.density_unit_conversion
      Field Meter Tag: paths.field_meter_tag
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 8
    col: 12
    width: 12
    height: 9
  - title: Average Pressure
    name: Average Pressure
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.property_measured, paths.field_meter_tag,
      measurements.average_value]
    pivots: [measurements.property_measured, paths.field_meter_tag]
    filters:
      measurements.property_measured: pressure
    sorts: [measurements.property_measured, measurements.dynamic_timeframe, paths.field_meter_tag]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Average Pressure (Pa), orientation: left, series: [{axisId: measurements.average_value,
            id: pressure - M_1002 - measurements.average_value, name: pressure - M_1002},
          {axisId: measurements.average_value, id: pressure - M_1003 - measurements.average_value,
            name: pressure - M_1003}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Field Meter Tag: paths.field_meter_tag
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 17
    col: 12
    width: 12
    height: 9
  - title: Flow Rate Total vs Average
    name: Flow Rate Total vs Average
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.total_value, measurements.average_value,
      measurements.property_measured, paths.field_meter_tag]
    pivots: [measurements.property_measured, paths.field_meter_tag]
    filters:
      measurements.property_measured: flowrate
    sorts: [measurements.property_measured, measurements.dynamic_timeframe, paths.field_meter_tag]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total Flow Rate (E3m3/d), orientation: left, series: [{axisId: measurements.total_value,
            id: flowrate - M_1000 - measurements.total_value, name: flowrate - M_1000
              - Measurements Total Value}, {axisId: measurements.total_value, id: flowrate
              - M_1001 - measurements.total_value, name: flowrate - M_1001 - Measurements
              Total Value}, {axisId: measurements.total_value, id: flowrate - M_1002
              - measurements.total_value, name: flowrate - M_1002 - Measurements Total
              Value}, {axisId: measurements.total_value, id: flowrate - M_1003 - measurements.total_value,
            name: flowrate - M_1003 - Measurements Total Value}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: Average Flow Rate (E3m3/d), orientation: right, series: [
          {axisId: measurements.average_value, id: flowrate - M_1000 - measurements.average_value,
            name: flowrate - M_1000 - Measurements Average Value}, {axisId: measurements.average_value,
            id: flowrate - M_1001 - measurements.average_value, name: flowrate - M_1001
              - Measurements Average Value}, {axisId: measurements.average_value,
            id: flowrate - M_1002 - measurements.average_value, name: flowrate - M_1002
              - Measurements Average Value}, {axisId: measurements.average_value,
            id: flowrate - M_1003 - measurements.average_value, name: flowrate - M_1003
              - Measurements Average Value}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Field Meter Tag: paths.field_meter_tag
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 8
    col: 0
    width: 12
    height: 9
  - title: New Tile
    name: New Tile
    model: facilities-demo
    explore: measurements
    type: single_value
    fields: [devices.device_id]
    sorts: [devices.device_id]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
    custom_color: "#215AC8"
    single_value_title: Device ID
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd,
          palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    refresh: 1 day
    listen:
      Field Meter Tag: paths.field_meter_tag
      Timeframe: measurements.timestamp_second
    row: 2
    col: 0
    width: 6
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: facilities-demo
    explore: measurements
    type: single_value
    fields: [devices.manufacturer]
    sorts: [devices.manufacturer]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
    custom_color: "#215AC8"
    single_value_title: Device Make
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd,
          palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    refresh: 1 day
    listen:
      Field Meter Tag: paths.field_meter_tag
      Timeframe: measurements.timestamp_second
    row: 6
    col: 6
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: facilities-demo
    explore: measurements
    type: single_value
    fields: [devices.meter_type]
    sorts: [devices.meter_type]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
    custom_color: "#215AC8"
    single_value_title: Meter Type
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    refresh: 1 day
    listen:
      Field Meter Tag: paths.field_meter_tag
      Timeframe: measurements.timestamp_second
    row: 6
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (4)
    model: facilities-demo
    explore: measurements
    type: single_value
    fields: [devices.model_number]
    sorts: [devices.model_number]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
    custom_color: "#215AC8"
    single_value_title: Model Number
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    refresh: 1 day
    listen:
      Field Meter Tag: paths.field_meter_tag
      Timeframe: measurements.timestamp_second
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Critical Events by Day
    name: Critical Events by Day
    model: facilities-demo
    explore: events_summary_view
    type: marketplace_viz_calendar_heatmap::calendar_heatmap-marketplace
    fields: [events_summary_view.count_of_events, events_summary_view.start_date]
    fill_fields: [events_summary_view.start_date]
    sorts: [events_summary_view.start_date desc]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    series_types: {}
    defaults_version: 0
    listen:
      Field Meter Tag: paths.field_meter_tag
    row: 2
    col: 12
    width: 12
    height: 6
  - title: Average Temperature
    name: Average Temperature
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.property_measured, paths.field_meter_tag,
      measurements.average_value]
    pivots: [measurements.property_measured, paths.field_meter_tag]
    filters:
      measurements.property_measured: temperature
    sorts: [measurements.property_measured, measurements.dynamic_timeframe, paths.field_meter_tag]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Average Temperature (°C), orientation: left, series: [{axisId: measurements.average_value,
            id: temperature - M_1003 - measurements.average_value, name: temperature
              - M_1003}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Field Meter Tag: paths.field_meter_tag
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 17
    col: 0
    width: 12
    height: 9
  filters:
  - name: Field Meter Tag
    title: Field Meter Tag
    type: field_filter
    default_value: '"M_1000"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: paths.field_meter_tag
  - name: Time Granularity
    title: Time Granularity
    type: field_filter
    default_value: Hour
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements.timeframe_picker
  - name: Timeframe
    title: Timeframe
    type: field_filter
    default_value: 3 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements.timestamp_second
  - name: Density Unit Conversion
    title: Density Unit Conversion
    type: field_filter
    default_value: kg
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements.density_unit_conversion

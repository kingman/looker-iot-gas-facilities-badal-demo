- dashboard: 5_indicators_and_analytics
  title: "(5) Indicators and Analytics"
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 minute
  elements:
  - title: 1 Min Moving Average
    name: 1 Min Moving Average
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.average_value, measurements_window_1min.1min_simple_moving_average,
      measurements_window_1min.timestamp_minute, measurements_window_1min.device_id,
      measurements_window_1min.property_measured]
    pivots: [measurements_window_1min.device_id, measurements_window_1min.property_measured]
    fill_fields: [measurements_window_1min.timestamp_minute]
    filters: {}
    sorts: [measurements_window_1min.timestamp_minute desc, measurements_window_1min.device_id,
      measurements_window_1min.property_measured]
    limit: 1440
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
    show_null_points: false
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Device ID: measurements_window_1min.device_id
      Property Measured: measurements_window_1min.property_measured
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Relative Strength Index (RSI) - 1 Min
    name: Relative Strength Index (RSI) - 1 Min
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements_window_1min.timestamp_minute, measurements_window_1min.device_id,
      measurements_window_1min.property_measured, measurements_window_1min.1min_relative_strength_indicator]
    pivots: [measurements_window_1min.device_id, measurements_window_1min.property_measured]
    fill_fields: [measurements_window_1min.timestamp_minute]
    filters: {}
    sorts: [measurements_window_1min.timestamp_minute desc, measurements_window_1min.device_id,
      measurements_window_1min.property_measured]
    limit: 1440
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    listen:
      Device ID: measurements_window_1min.device_id
      Property Measured: measurements_window_1min.property_measured
    row: 10
    col: 0
    width: 12
    height: 8
  - title: Relative Strength Index (RSI) - 10 Min
    name: Relative Strength Index (RSI) - 10 Min
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements_window_10min.10min_relative_strength_indicator, measurements_window_10min.timestamp_minute10,
      measurements_window_10min.device_id, measurements_window_10min.property_measured]
    pivots: [measurements_window_10min.device_id, measurements_window_10min.property_measured]
    fill_fields: [measurements_window_10min.timestamp_minute10]
    filters: {}
    sorts: [measurements_window_10min.timestamp_minute10 desc, measurements_window_10min.device_id,
      measurements_window_10min.property_measured]
    limit: 288
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    listen:
      Device ID: measurements_window_10min.device_id
      Property Measured: measurements_window_10min.property_measured
    row: 10
    col: 12
    width: 12
    height: 8
  - title: 10 Min Moving Average
    name: 10 Min Moving Average
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements_window_10min.timestamp_minute10, measurements_window_10min.device_id,
      measurements_window_10min.property_measured, measurements_window_10min.10min_simple_moving_average,
      measurements.average_value]
    pivots: [measurements_window_10min.device_id, measurements_window_10min.property_measured]
    fill_fields: [measurements_window_10min.timestamp_minute10]
    filters: {}
    sorts: [measurements_window_10min.timestamp_minute10 desc, measurements_window_10min.device_id,
      measurements_window_10min.property_measured]
    limit: 288
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
    show_null_points: false
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Device ID: measurements_window_10min.device_id
      Property Measured: measurements_window_10min.property_measured
    row: 2
    col: 12
    width: 12
    height: 8
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
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tIndicators\
      \ and Analytics\n\t</h1>\n</span>\n<span style=\"padding: 4px; float:right;\"\
      >\n\t<a style=\"background-color: #fff; color: #5f6368; padding: 5px 10px;\"\
      \ href=\"https://badalio.cloud.looker.com/boards/3\">Home</a>\n\t<a style=\"\
      background-color: #fff; color: #5f6368; padding: 5px 10px;\" href=\"https://badalio.cloud.looker.com/explore/facilities-demo/measurements\"\
      >Explore</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding:\
      \ 5px 10px;\" href=\"https://badalio.ca.looker.com/dashboards-next/8?Timestamp+Date=7+day\"\
      >Go Back to Facilities Overview</a>\n</span>\n\n<div>"
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Device ID
    title: Device ID
    type: field_filter
    default_value: '"Coriolis_01"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements_window_1min.device_id
  - name: Property Measured
    title: Property Measured
    type: field_filter
    default_value: flowrate
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements_window_1min.property_measured

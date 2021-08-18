- dashboard: 3_asset_overview
  title: "(3) Asset Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
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
      \ 5px 10px;\" href=\"https://badalio.cloud.looker.com/dashboards-next/18\"\
      >Go Back to Facilities Overview</a>\n</span>\n\n<div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Inlet vs Outlet Density
    name: Inlet vs Outlet Density
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.total_value, assets.asset_id,
      paths.designation]
    pivots: [assets.asset_id, paths.designation]
    filters:
      measurements.property_measured: density
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.designation]
    limit: 5000
    query_timezone: UTC
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
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 24
    col: 0
    width: 24
    height: 8
  - title: Inlet vs Outlet Flow
    name: Inlet vs Outlet Flow
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.total_value, assets.asset_id,
      paths.designation]
    pivots: [assets.asset_id, paths.designation]
    filters:
      measurements.property_measured: flowrate
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.designation]
    limit: 5000
    query_timezone: UTC
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
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 5
    col: 0
    width: 24
    height: 8
  - title: Inlet vs Outlet Average Pressure
    name: Inlet vs Outlet Average Pressure
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.designation, measurements.average_value]
    pivots: [assets.asset_id, paths.designation]
    filters:
      measurements.property_measured: pressure
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.designation]
    limit: 5000
    query_timezone: UTC
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
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 43
    col: 0
    width: 24
    height: 8
  - title: Inlet vs Outlet Average Temperature
    name: Inlet vs Outlet Average Temperature
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.designation, measurements.average_value]
    pivots: [assets.asset_id, paths.designation]
    filters:
      measurements.property_measured: temperature
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.designation]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 62
    col: 0
    width: 24
    height: 8
  - title: Inlet Average Temperature by Measurement Points
    name: Inlet Average Temperature by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, measurements.average_value,
      paths.field_meter_tag]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: temperature
      paths.designation: inlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 70
    col: 12
    width: 12
    height: 8
  - title: Outlet Average Temperature by Measurement Points
    name: Outlet Average Temperature by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, measurements.average_value,
      paths.field_meter_tag]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: temperature
      paths.designation: outlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 70
    col: 0
    width: 12
    height: 8
  - title: Inlet Density by Measurement Points
    name: Inlet Density by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.total_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: density
      paths.designation: inlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 32
    col: 0
    width: 12
    height: 8
  - title: Outlet Density by Measurement Points
    name: Outlet Density by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.total_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: density
      paths.designation: outlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 32
    col: 12
    width: 12
    height: 8
  - title: Inlet Flow Rate by Measurement Points
    name: Inlet Flow Rate by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.total_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: flowrate
      paths.designation: inlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 13
    col: 0
    width: 12
    height: 8
  - title: Outlet Flow Rate by Measurement Points
    name: Outlet Flow Rate by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.total_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: flowrate
      paths.designation: outlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 13
    col: 12
    width: 12
    height: 8
  - title: Inlet Average Pressure by Measurement Points
    name: Inlet Average Pressure by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.average_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: pressure
      paths.designation: inlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 51
    col: 0
    width: 12
    height: 8
  - title: Outlet Average Pressure by Measurement Points
    name: Outlet Average Pressure by Measurement Points
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag,
      measurements.average_value]
    pivots: [assets.asset_id, paths.field_meter_tag]
    filters:
      measurements.property_measured: pressure
      paths.designation: outlet
    sorts: [measurements.dynamic_timeframe, assets.asset_id, paths.field_meter_tag]
    limit: 5000
    query_timezone: UTC
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
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 51
    col: 12
    width: 12
    height: 8
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Flow Rate Measurements</h1>
    row: 2
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Density Measurements</h1>
    row: 21
    col: 0
    width: 24
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Pressure Measurements</h1>
    row: 40
    col: 0
    width: 24
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Temperature Measurements</h1>
    row: 59
    col: 0
    width: 24
    height: 3
  filters:
  - name: Asset ID
    title: Asset ID
    type: field_filter
    default_value: '"Facility_01"'
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: assets.asset_id
  - name: Time Granularity
    title: Time Granularity
    type: field_filter
    default_value: Minute
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
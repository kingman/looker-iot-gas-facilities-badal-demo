- dashboard: 3_asset_overview
  title: "(3) Asset Overview"
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
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tAsset Overview\n\
      \t</h1>\n</span>\n<span style=\"padding: 4px; float:right;\">\n\t<a style=\"\
      background-color: #fff; color: #5f6368; padding: 5px 10px;\" href=\"https://badalio.cloud.looker.com/boards/3\"\
      >Home</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding: 5px\
      \ 10px;\" href=\"https://badalio.cloud.looker.com/explore/facilities-demo/measurements\"\
      >Explore</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding:\
      \ 5px 10px;\" href=\"https://badalio.ca.looker.com/dashboards-next/8?Timestamp+Date=7+day\"\
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
      Density Unit Conversion: measurements.density_unit_conversion
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 20
    col: 0
    width: 15
    height: 12
  - title: Inlet vs Outlet Flow Rate
    name: Inlet vs Outlet Flow Rate
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
            id: Facility_01 - inlet - measurements.total_value, name: Facility_01
              - inlet}, {axisId: measurements.total_value, id: Facility_01 - outlet
              - measurements.total_value, name: Facility_01 - outlet}, {axisId: measurements.total_value,
            id: P_01 - inlet - measurements.total_value, name: P_01 - inlet}, {axisId: measurements.total_value,
            id: P_01 - outlet - measurements.total_value, name: P_01 - outlet}, {
            axisId: measurements.total_value, id: Tank_01 - inlet - measurements.total_value,
            name: Tank_01 - inlet}, {axisId: measurements.total_value, id: Tank_01
              - outlet - measurements.total_value, name: Tank_01 - outlet}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 5
    col: 0
    width: 15
    height: 12
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
            id: Facility_01 - outlet - measurements.average_value, name: Facility_01
              - outlet}, {axisId: measurements.average_value, id: P_01 - inlet - measurements.average_value,
            name: P_01 - inlet}, {axisId: measurements.average_value, id: P_01 - outlet
              - measurements.average_value, name: P_01 - outlet}, {axisId: measurements.average_value,
            id: Tank_01 - outlet - measurements.average_value, name: Tank_01 - outlet}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 35
    col: 0
    width: 15
    height: 12
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
            id: Facility_01 - outlet - measurements.average_value, name: Facility_01
              - outlet}, {axisId: measurements.average_value, id: P_01 - outlet -
              measurements.average_value, name: P_01 - outlet}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 50
    col: 0
    width: 15
    height: 12
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Average Temperature (°C), orientation: left, series: [{axisId: measurements.average_value,
            id: measurements.average_value, name: Average Value}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 56
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Average Temperature (°C), orientation: left, series: [{axisId: measurements.average_value,
            id: Facility_01 - M_1003 - measurements.average_value, name: Facility_01
              - M_1003}, {axisId: measurements.average_value, id: P_01 - M_1003 -
              measurements.average_value, name: P_01 - M_1003}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 50
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Density Unit Conversion: measurements.density_unit_conversion
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 20
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Density Unit Conversion: measurements.density_unit_conversion
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 26
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Total Flow Rate (E3m3/d), orientation: left, series: [{axisId: measurements.total_value,
            id: Facility_01 - M_1000 - measurements.total_value, name: Facility_01
              - M_1000}, {axisId: measurements.total_value, id: Facility_01 - M_1001
              - measurements.total_value, name: Facility_01 - M_1001}, {axisId: measurements.total_value,
            id: P_01 - M_1002 - measurements.total_value, name: P_01 - M_1002}, {
            axisId: measurements.total_value, id: Tank_01 - M_1000 - measurements.total_value,
            name: Tank_01 - M_1000}, {axisId: measurements.total_value, id: Tank_01
              - M_1001 - measurements.total_value, name: Tank_01 - M_1001}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 5
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Total Flow Rate (E3m3/d), orientation: left, series: [{axisId: measurements.total_value,
            id: Facility_01 - M_1003 - measurements.total_value, name: Facility_01
              - M_1003}, {axisId: measurements.total_value, id: P_01 - M_1003 - measurements.total_value,
            name: P_01 - M_1003}, {axisId: measurements.total_value, id: Tank_01 -
              M_1002 - measurements.total_value, name: Tank_01 - M_1002}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 11
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Average Pressure (Pa), orientation: left, series: [{axisId: measurements.average_value,
            id: P_01 - M_1002 - measurements.average_value, name: P_01 - M_1002}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 35
    col: 15
    width: 9
    height: 6
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: Average Pressure (Pa), orientation: left, series: [{axisId: measurements.average_value,
            id: Facility_01 - M_1003 - measurements.average_value, name: Facility_01
              - M_1003}, {axisId: measurements.average_value, id: P_01 - M_1003 -
              measurements.average_value, name: P_01 - M_1003}, {axisId: measurements.average_value,
            id: Tank_01 - M_1002 - measurements.average_value, name: Tank_01 - M_1002}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Asset ID: assets.asset_id
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
    row: 41
    col: 15
    width: 9
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Flow Rate Measurements</h1>
    row: 2
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Density Measurements</h1>
    row: 17
    col: 0
    width: 24
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Pressure Measurements</h1>
    row: 32
    col: 0
    width: 24
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Temperature Measurements</h1>
    row: 47
    col: 0
    width: 24
    height: 3
  - title: Shrinkage Volume
    name: Shrinkage Volume
    model: facilities-demo
    explore: shrinkage_view
    type: looker_line
    fields: [shrinkage_view.dynamic_timeframe, shrinkage_view.total_shrinkage_volume,
      shrinkage_view.asset_id]
    pivots: [shrinkage_view.asset_id]
    filters: {}
    sorts: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id]
    limit: 5000
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
    y_axes: [{label: Total Shrinkage Volume (m3), orientation: left, series: [{axisId: shrinkage_view.total_shrinkage_volume,
            id: Facility_01 - shrinkage_view.total_shrinkage_volume, name: Facility_01},
          {axisId: shrinkage_view.total_shrinkage_volume, id: Tank_01 - shrinkage_view.total_shrinkage_volume,
            name: Tank_01}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      Facility_01 - shrinkage_view.total_shrinkage_volume: "#10C871"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Asset ID: shrinkage_view.asset_id
      Time Granularity: shrinkage_view.timeframe_picker
      Timeframe: shrinkage_view.timestamp_second
    row: 65
    col: 0
    width: 12
    height: 7
  - title: Mixed Volume
    name: Mixed Volume
    model: facilities-demo
    explore: shrinkage_view
    type: looker_line
    fields: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id, shrinkage_view.total_mixed_volume]
    pivots: [shrinkage_view.asset_id]
    filters: {}
    sorts: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id]
    limit: 5000
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
    y_axes: [{label: Total Mixed Volume (m3), orientation: left, series: [{axisId: shrinkage_view.total_mixed_volume,
            id: Facility_01 - shrinkage_view.total_mixed_volume, name: Facility_01},
          {axisId: shrinkage_view.total_mixed_volume, id: Tank_01 - shrinkage_view.total_mixed_volume,
            name: Tank_01}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      Facility_01 - shrinkage_view.total_mixed_volume: "#FD9577"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Asset ID: shrinkage_view.asset_id
      Time Granularity: shrinkage_view.timeframe_picker
      Timeframe: shrinkage_view.timestamp_second
    row: 65
    col: 12
    width: 12
    height: 7
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2

      <h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px black; height: 60px; color: black; text-align: center;">Shrinkage & Over/Short Measurements</h1>
    row: 62
    col: 0
    width: 24
    height: 3
  - title: Over/Short Volume
    name: Over/Short Volume
    model: facilities-demo
    explore: shrinkage_view
    type: looker_line
    fields: [over_short_view.total_over_short, shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id]
    pivots: [shrinkage_view.asset_id]
    filters: {}
    sorts: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id]
    limit: 500
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
    y_axes: [{label: Total Over/Short Volume (m3), orientation: left, series: [{axisId: over_short_view.total_over_short,
            id: Facility_01 - over_short_view.total_over_short, name: Facility_01},
          {axisId: over_short_view.total_over_short, id: Tank_01 - over_short_view.total_over_short,
            name: Tank_01}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      Facility_01 - over_short_view.total_over_short: "#9E7FD0"
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
    defaults_version: 1
    listen:
      Asset ID: shrinkage_view.asset_id
      Time Granularity: shrinkage_view.timeframe_picker
      Timeframe: shrinkage_view.timestamp_second
    row: 72
    col: 0
    width: 12
    height: 7
  - title: Volume Measurement Inaccuracy
    name: Volume Measurement Inaccuracy
    model: facilities-demo
    explore: shrinkage_view
    type: looker_line
    fields: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id, over_short_view.measurement_inaccuracy]
    pivots: [shrinkage_view.asset_id]
    filters: {}
    sorts: [shrinkage_view.dynamic_timeframe, shrinkage_view.asset_id]
    limit: 500
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
    y_axes: [{label: Total Volume Measurement Inaccuracy (m3), orientation: left,
        series: [{axisId: over_short_view.measurement_inaccuracy, id: Facility_01
              - over_short_view.measurement_inaccuracy, name: Facility_01}, {axisId: over_short_view.measurement_inaccuracy,
            id: Tank_01 - over_short_view.measurement_inaccuracy, name: Tank_01}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      Facility_01 - over_short_view.measurement_inaccuracy: "#f56776"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Asset ID: shrinkage_view.asset_id
      Time Granularity: shrinkage_view.timeframe_picker
      Timeframe: shrinkage_view.timestamp_second
    row: 72
    col: 12
    width: 12
    height: 7
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

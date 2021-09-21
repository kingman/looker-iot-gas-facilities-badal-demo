- dashboard: 4_event_overview
  title: "(4) Event Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 10 seconds
  elements:
  - title: Measurements Across Devices
    name: Measurements Across Devices
    model: facilities-demo
    explore: measurements
    type: looker_line
    fields: [measurements.dynamic_timeframe, measurements.property_measured, devices.device_id,
      measurements.average_value]
    pivots: [measurements.property_measured, devices.device_id]
    filters: {}
    sorts: [measurements.property_measured, devices.device_id, measurements.dynamic_timeframe]
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
    show_null_points: false
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_series: []
    listen:
      Time Granularity: measurements.timeframe_picker
      Timeframe: measurements.timestamp_second
      Property Measured: measurements.property_measured
    row: 2
    col: 12
    width: 12
    height: 7
  - title: Duration of Similar Events
    name: Duration of Similar Events
    model: facilities-demo
    explore: measurements_raw_events_duration
    type: looker_line
    fields: [measurements_raw_events_duration.event_value, measurements_raw_events_duration.duration_seconds,
      measurements_raw_events_duration.device_id, measurements_raw_events_duration.event_id]
    pivots: [measurements_raw_events_duration.device_id, measurements_raw_events_duration.event_id]
    filters:
      measurements_raw_events_duration.event_id: "-NULL"
    sorts: [measurements_raw_events_duration.duration_seconds, measurements_raw_events_duration.device_id,
      measurements_raw_events_duration.event_id]
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
    show_null_points: false
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Property Measured: measurements_raw_events_duration.property_measured
    row: 9
    col: 0
    width: 24
    height: 7
  - title: Highlighted Event Type
    name: Highlighted Event Type
    model: facilities-demo
    explore: measurements
    type: looker_timeline
    fields: [paths.field_meter_tag, events_summary_view.event_type, events_summary_view.start_minute,
      events_summary_view.end_minute, measurements_raw_events.average_value]
    sorts: [paths.field_meter_tag desc]
    limit: 500
    column_limit: 50
    groupBars: true
    labelSize: 10pt
    showLegend: true
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      custom:
        id: 7f45430d-15dc-5241-9350-b7f3bc7dc275
        label: Custom
        type: continuous
        stops:
        - color: "#f56776"
          offset: 0
        - color: "#FD9577"
          offset: 25
        - color: "#fbff25"
          offset: 50
        - color: "#ACE9F5"
          offset: 75
        - color: "#54AAE2"
          offset: 100
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    listen:
      Timeframe: events_summary_view.start_minute
      Property Measured: events_summary_view.property_measured
    row: 2
    col: 0
    width: 12
    height: 7
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
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tEvent Overview\n\
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
  filters:
  - name: Property Measured
    title: Property Measured
    type: field_filter
    default_value: temperature
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements.property_measured
  - name: Time Granularity
    title: Time Granularity
    type: field_filter
    default_value: Minute
    allow_multiple_values: true
    required: true
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
    default_value: 1 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: facilities-demo
    explore: measurements
    listens_to_filters: []
    field: measurements.timestamp_second

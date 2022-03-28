include: "measurements.view"

# this view is for filtered measures

view: measurements_extended {
  extends: [measurements]


  measure: total_volume {
    group_label: "Volume Measurements"
    type: sum
    value_format_name: decimal_2
    sql: CASE WHEN ${property_measured} = 'volume' THEN ${value} ELSE 0 END;;
  }

  measure: volume_max {
    group_label: "Volume Measurements"
    type: max
    value_format_name: decimal_2
    sql: CASE WHEN ${property_measured} = 'volume' THEN ${value} ELSE 0 END;;
  }

  measure: volume_min {
    group_label: "Volume Measurements"
    type: min
    value_format_name: decimal_2
    sql: CASE WHEN ${property_measured} = 'volume' THEN ${value} ELSE 0 END;;
  }

  measure: volume_mean {
    group_label: "Volume Measurements"
    type: average
    value_format_name: decimal_2
    sql: CASE WHEN ${property_measured} = 'volume' THEN ${value} ELSE 0 END;;
  }

  measure: volume_median {
    group_label: "Volume Measurements"
    type: median
    value_format_name: decimal_2
    sql: CASE WHEN ${property_measured} = 'volume' THEN ${value} ELSE 0 END;;
  }
}

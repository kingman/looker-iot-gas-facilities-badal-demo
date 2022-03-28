view: measurements_window_10min {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.measurements_window_10min`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.timestamp, ${TABLE}.property_measured) ;;
  }

  dimension: device_id {
    hidden: no
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: property_measured {
    hidden: no
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  dimension: relative_strength_indicator {
    hidden: yes
    type: number
    sql: ${TABLE}.RELATIVE_STRENGTH_INDICATOR ;;
  }

  dimension: simple_moving_average {
    hidden: yes
    type: number
    sql: ${TABLE}.SIMPLE_MOVING_AVERAGE ;;
  }

  dimension_group: timestamp {
    hidden: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour,
      minute,
      minute10,
      second
    ]
    sql: ${TABLE}.timestamp ;;
  }

### Measures

  measure: count_of_10minute_measurements {
    type: count
    drill_fields: []
  }

  measure: 10min_relative_strength_indicator {
    label: "RSI - 10 min"
    type: average
    sql: ${relative_strength_indicator} ;;
  }

  measure: 10min_simple_moving_average {
    label: "Moving Average - 10 min"
    type: average
    sql: ${simple_moving_average} ;;
  }
}

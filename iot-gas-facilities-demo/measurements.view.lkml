view: measurements {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.measurements_raw`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.timestamp, ${TABLE}.property_measured) ;;
  }

  dimension: device_id {
    type: string
    hidden: yes
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}.device_version ;;
  }

  dimension: property_measured {
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  dimension_group: timestamp {
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

  dimension: units_of_measurement {
    type: string
    sql: ${TABLE}.units_of_measurement ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

### Filter for picking the timefram granularity using the dynamic timeframe dimension

  parameter: timeframe_picker {
    label: "Time Granularity"
    type: string
    allowed_value: { value: "Minute" }
    allowed_value: { value: "10 Minutes" }
    allowed_value: { value: "Hour" }
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Date"
  }

  dimension: dynamic_timeframe {
    label: "Date/Time"
    type: string
    sql:
      CASE
        WHEN {% parameter timeframe_picker %} = 'Minute' THEN CAST(${measurements.timestamp_minute} AS STRING)
        WHEN {% parameter timeframe_picker %} = '10 Minutes' THEN CAST(${measurements.timestamp_minute10} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Hour' THEN CAST(${measurements.timestamp_hour} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${measurements.timestamp_date} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(${measurements.timestamp_week} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Month' THEN CAST(${measurements.timestamp_month} AS STRING)
      END ;;
  }

  # dimension: time {

  #   sql:
  #     CASE
  #       WHEN
  #         DATE_DIFF(
  #                 cast({% date_start timestamp_date %} as date),
  #                 cast({% date_end timestamp_date  %} as date),
  #                 DAY
  #                 ) >365
  #       THEN cast(${timestamp_week}) as string
  #       WHEN
  #         DATE_DIFF(
  #                 cast({% date_start timestamp_date %} as date),
  #                 cast({% date_end timestamp_date  %} as date),
  #                 DAY
  #                 ) >30
  #       THEN cast(${timestamp_date}) as string
  #       WHEN
  #         DATE_DIFF(
  #                 cast({% date_start timestamp_date %} as date),
  #                 cast({% date_end timestamp_date  %} as date),
  #                 DAY
  #                 ) >1
  #       THEN cast(${timestamp_hour}) as string

  #       ELSE CAST(${timestamp_minute} AS STRING)
  #       END
  #     ;;
  # }


### MEASURES ###

  measure: count_of_measurements {
    type: count
    drill_fields: [devices.device_id]
  }

  measure: total_value {
    hidden: no
    type: sum
    sql: ${value} ;;
    value_format_name: decimal_2
  }

  measure: average_value {
    # label: "Average Value per Measurement"
    hidden: no
    type: average
    sql: ${value} ;;
    value_format_name: decimal_2
  }

  measure: median_value {
    hidden: no
    type: median
    sql: ${value} ;;
    value_format_name: decimal_2
  }
}

# This view does not have liquid syntax so events are aggregated correctly.

view: events_summary_extended {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.events_summary_view`
    ;;

  dimension: event_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      minute,
      second
    ]
    sql: ${TABLE}.end_time ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: property_measured {
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  dimension: severity {
    type: string
    sql:
        CASE
          WHEN ${TABLE}.severity IS NOT NULL THEN ${TABLE}.severity
          WHEN ${property_measured} = 'temperature' THEN 'High'
          WHEN ${property_measured} = 'flowrate' THEN 'Medium'
          ELSE 'Medium'
        END;;
  }

  dimension: severity_level {
    type: number
    sql:
        CASE
          WHEN ${severity} = 'Low' THEN 1
          WHEN ${severity} = 'Medium' THEN 2
          WHEN ${severity} = 'High' THEN 3
          ELSE 4
        END;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      minute,
      second
    ]
    sql: ${TABLE}.start_time ;;
  }

  # dimension_group: of_event_duration {
  #   type: duration
  #   intervals: [
  #     day,
  #     hour,
  #     minute,
  #     second
  #   ]
  #   sql_start: ${start_raw} ;;
  #   sql_end: ${end_raw} ;;
  # }

  # measure: total_duration {
  #   type: sum
  #   sql: ${minutes_of_event_duration} ;;
  # }

  dimension: event_duration_minutes {
    type: number
    sql: TIMESTAMP_DIFF(${end_raw}, ${start_raw}, MINUTE);;
  }

  measure: total_event_duration_minutes {
    type: sum
    sql:  ${event_duration_minutes} ;;
  }

  measure: count_of_events{
    type: count
    drill_fields: []
  }
}

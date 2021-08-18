view: events_summary_view {
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

  measure: count_of_events{
    type: count
    drill_fields: []
  }
}

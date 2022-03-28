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
    link: {
      label: "Examine this Event"
      #url: "https://badalio.ca.looker.com/dashboards-next/11?Property%20Measured={{ events_summary_view.property_measured._value | encode_uri }}&Time%20Granularity=Minute&Timeframe=before%20{{ events_summary_view.end_minute._value | encode_uri }}"
      url: "https://badalio.ca.looker.com/dashboards-next/11?Property%20Measured={{ events_summary_view.property_measured._value | encode_uri }}&Time%20Granularity=Minute&Timeframe=after%20{{ events_summary_view.start_minute._value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Examine Field Meter during this Event"
      url: "https://badalio.ca.looker.com/dashboards-next/9?Field+Meter+Tag=%22{{ paths.field_meter_tag._value | encode_uri }}%22&Time+Granularity=Second&Timeframe={{ events_summary_view.start_minute._value | encode_uri }}+to+{{ events_summary_view.end_minute._value | encode_uri }}&Density+Unit+Conversion=kg"
      icon_url: "http://www.looker.com/favicon.ico"
    }
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

  dimension_group: of_event_duration {
    type: duration
    intervals: [
      day,
      hour,
      minute,
      second
    ]
    sql_start: ${start_raw} ;;
    sql_end: ${end_raw} ;;
  }


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

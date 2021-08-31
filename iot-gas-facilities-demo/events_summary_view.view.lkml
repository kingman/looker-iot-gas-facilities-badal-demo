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

  measure: count_of_events{
    type: count
    drill_fields: []
  }
}

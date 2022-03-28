view: measurements_raw_events_duration {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.measurements_raw_events_duration`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.timestamp, ${TABLE}.property_measured, ${TABLE}.event_type) ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}.device_version ;;
  }

  dimension: duration_seconds {
    label: "Duration (Seconds)"
    type: number
    sql: ${TABLE}.duration_seconds ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
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
    sql: ${TABLE}.severity ;;
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
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

### MEASURES ###

  measure: event_value {
    type: sum
    sql:
      CASE
        WHEN ${property_measured} = 'flowrate'
          THEN ${value}*0.024
        ELSE
          ${value}
      END ;;
  }

  measure: average_value {
    type: average
    sql:
      CASE
        WHEN ${property_measured} = 'flowrate'
          THEN ${value}*0.024
        ELSE
          ${value}
      END ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}

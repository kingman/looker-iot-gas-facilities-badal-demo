view: shrinkage_view {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.shrinkage_view`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.asset_id, ${TABLE}.timestamp) ;;
  }

  dimension: asset_id {
    hidden: no
    type: string
    sql: ${TABLE}.asset_id ;;
  }

  dimension: mixed_volume {
    hidden: yes
    type: number
    sql: ${TABLE}.mixed_volume ;;
  }

  dimension: shrinkage {
    hidden: yes
    type: number
    sql: ${TABLE}.shrinkage ;;
  }

  dimension: shrinkage_volume {
    hidden: yes
    type: number
    sql: ${TABLE}.shrinkage_volume ;;
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

  dimension: total_inlet_flowrate {
    hidden: yes
    type: number
    sql: ${TABLE}.total_inlet_flowrate ;;
  }

### Filter for picking the timefram granularity using the dynamic timeframe dimension

  parameter: timeframe_picker {
    label: "Time Granularity"
    type: string
    allowed_value: { value: "Second" }
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
        WHEN {% parameter timeframe_picker %} = 'Second' THEN CAST(${shrinkage_view.timestamp_second} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Minute' THEN CAST(${shrinkage_view.timestamp_minute} AS STRING)
        WHEN {% parameter timeframe_picker %} = '10 Minutes' THEN CAST(${shrinkage_view.timestamp_minute10} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Hour' THEN CAST(${shrinkage_view.timestamp_hour} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${shrinkage_view.timestamp_date} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(${shrinkage_view.timestamp_week} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Month' THEN CAST(${shrinkage_view.timestamp_month} AS STRING)
      END ;;
  }


### MEASURES


  measure: total_mixed_volume {
    type: sum
    sql: ${mixed_volume};;
  }

  measure: total_shrinkage {
    type: sum
    sql: ${shrinkage} ;;
  }

  measure: total_shrinkage_volume {
    type: sum
    sql: ${shrinkage_volume};;
  }

  measure: average_mixed_volume {
    type: average
    sql: ${mixed_volume};;
  }

  measure: average_shrinkage {
    type: average
    sql: ${shrinkage} ;;
  }

  measure: average_shrinkage_volume {
    type: average
    sql: ${shrinkage_volume};;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

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
    hidden: yes
    type: string
    sql: ${TABLE}.asset_id ;;
  }

  dimension: mixed_volume {
    type: number
    sql: ${TABLE}.mixed_volume ;;
  }

  dimension: shrinkage {
    type: number
    sql: ${TABLE}.shrinkage ;;
  }

  dimension: shrinkage_volume {
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
    type: number
    sql: ${TABLE}.total_inlet_flowrate ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

include: "shrinkage_view.view"

view: over_short_view {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.over_short_view`
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

  dimension: balance {
    hidden: yes
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: inlet {
    hidden: yes
    type: number
    sql: ${TABLE}.inlet ;;
  }

  dimension: outlet {
    hidden: yes
    type: number
    sql: ${TABLE}.outlet ;;
  }

  dimension_group: timestamp {
    hidden: yes
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


### MEASURES


  measure: total_over_short {
    label: "Over/Short"
    type: sum
    sql: ${balance};;
  }

  measure: total_inlet_volume {
    type: sum
    sql: ${inlet};;
  }

  measure: total_outlet_volume {
    type: sum
    sql: ${outlet};;
  }

  measure: average_over_short {
    label: "Average Over/Short"
    type: average
    sql: ${balance};;
  }

  measure: average_inlet_volume {
    type: average
    sql: ${inlet};;
  }

  measure: average_outlet_volume {
    type: average
    sql: ${outlet};;
  }

  measure: measurement_inaccuracy {
    type: sum
    sql: ${balance} - ${shrinkage_view.shrinkage_volume};;
  }
}

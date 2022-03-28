view: paths {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.paths`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.asset_id, ${TABLE}.field_meter_tag) ;;
  }

  dimension: asset_id {
    type: string
    hidden: yes
    sql: ${TABLE}.asset_id ;;
  }

  dimension: designation {
    description: "Inlet or Outlet"
    type: string
    sql: ${TABLE}.designation ;;
  }

  dimension: field_meter_tag {
    type: string
    sql: ${TABLE}.field_meter_tag ;;
    link: {
      label: "{{value}} Field Meter Summary Dashboard"
      url: "https://badalio.ca.looker.com/dashboards-next/9?Field%20Meter%20Tag=%22{{ value | encode_uri }}%22&Time%20Granularity=Hour&Timestamp%20Date=3%20day&Density+Unit+Conversion=kg"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [assets.asset_id]
  }
}

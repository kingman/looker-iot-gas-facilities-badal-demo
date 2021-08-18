view: assets {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.assets`
    ;;
  drill_fields: [asset_id]

  dimension: asset_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.asset_id ;;
    link: {
      label: "{{value}} Asset Overview Dashboard"
      url: "https://badalio.cloud.looker.com/dashboards-next/17?Time%20Granularity=Hour&Asset%20ID=%22{{ value | encode_uri }}%22&Timeframe=7%20day"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  dimension: coordinates {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude};;
  }

  dimension: latitude {
    hidden: yes
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: string
    sql: ${TABLE}.longitude ;;
  }

  measure: count_of_assets{
    type: count
    drill_fields: [asset_id, paths.count]
  }
}
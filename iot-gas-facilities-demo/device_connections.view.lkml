view: device_connections {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.device_connections`
    ;;

  dimension: device_id {
    hidden: yes
    type: string
    # hidden: yes
    sql: ${TABLE}.device_id ;;
  }

  dimension: field_meter_tag {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.field_meter_tag ;;
  }

  measure: count_of_field_meter_tags {
    label: "Count of Field Meters"
    type: count
    drill_fields: [paths.field_meter_tag, devices.device_id, devices.meter_type, devices.manufacturer, devices.model_number]
  }
}

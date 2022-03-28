view: devices {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.devices`
    ;;
  drill_fields: [device_id]

  dimension: device_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: meter_type {
    type: string
    sql: ${TABLE}.meter_type ;;
  }

  dimension: model_number {
    type: string
    sql: ${TABLE}.model_number ;;
  }

  measure: count_of_devices {
    type: count
    drill_fields: [device_id, measurements.count, device_connections.count]
  }
}

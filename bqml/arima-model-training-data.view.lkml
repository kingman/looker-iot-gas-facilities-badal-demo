include: "/iot-gas-facilities-demo/measurements.view"
include: "/facilities-demo.model"

view: arima_model_training_data {
  derived_table: {
    datagroup_trigger: arima_trigger
    sql:
      SELECT
        DATETIME_TRUNC(timestamp, MINUTE) as timestamp_minutes,
        device_id,
        property_measured,
        SUM(value) as minute_value
      FROM `sandbox-keyera-poc.foglamp_demo.measurements_raw`
      GROUP BY timestamp_minutes, device_id, property_measured;;

  }

  # dimension_group: timestamp_minutes {
  #   type: time
  #   timeframes: [raw, date, hour, minute, second]
  #   sql: ${TABLE}.timestamp ;;
  # }

  dimension: timestamp_minutes {
    primary_key: no
    type: date_minute
    sql:  ${TABLE}.timestamp_minutes;;
  }

  dimension: device_id {
    type: string
  }

  dimension: property_measured {
    type: string
  }

  dimension: minute_value {
    type: number
  }
}

explore: arima_model_training_data {}

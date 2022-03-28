view: arima_forecast {

  derived_table: {
    datagroup_trigger: arima_trigger
    sql:
      SELECT *
      FROM ML.FORECAST(MODEL ${arima_model.SQL_TABLE_NAME}, STRUCT(2880 AS horizon, 0.99 AS confidence_level))
      ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.property_measured, ${TABLE}.forecast_timestamp) ;;
  }

  # These dimensions refer to the device and property combination that each ARIMA model is built for.

  dimension: device_id {
    description: "This specifies which Device ID & Measurement Property the ARIMA model is for."
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: property_measured {
    description: "This specifies which Device ID & Measurement Property the ARIMA model is for."
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  # These dimensions refer to the predicted values, as well as the corresponding timestamp.

  dimension_group: forecast {
    type: time
    timeframes: [raw, minute, time, date, week, month, year]
    sql: ${TABLE}.forecast_timestamp ;;
    convert_tz: no
  }

  dimension: forecast_value {
    hidden: yes
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  measure: forecast_count {
    label: "Count of Forecasts"
    type: count
  }

  measure: total_forecast {
    type: sum
    sql: ${forecast_value} ;;
    value_format_name: decimal_4
  }

  measure: total_prediction_interval_lower_bound {
    type: sum
    sql: ${prediction_interval_lower_bound} ;;
    value_format_name: decimal_4
  }

  measure: total_prediction_interval_upper_bound {
    type: sum
    sql: ${prediction_interval_upper_bound} ;;
    value_format_name: decimal_4
  }

}

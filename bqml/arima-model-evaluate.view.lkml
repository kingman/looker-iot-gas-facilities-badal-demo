view: arima_model_evaluate {

  derived_table: {
    datagroup_trigger: arima_trigger
    sql:
      SELECT *
      FROM ML.ARIMA_EVALUATE(MODEL ${arima_model.SQL_TABLE_NAME})
      ;;
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

  # These dimensions refer to the attributes of each ARIMA model.

  dimension: non_seasonal_p {
    label: "Non Seasonal p"
    type: number
    sql: ${TABLE}.non_seasonal_p ;;
  }

  dimension: non_seasonal_d {
    label: "Non Seasonal d"
    type: number
    sql: ${TABLE}.non_seasonal_d ;;
  }

  dimension: non_seasonal_q {
    label: "Non Seasonal q"
    type: number
    sql: ${TABLE}.non_seasonal_q ;;
  }

  dimension: has_drift {
    type: string
    sql: ${TABLE}.has_drift ;;
  }

  dimension: log_likelihood {
    type: number
    sql: ${TABLE}.log_likelihood ;;
  }

  dimension: aic {
    label: "AIC"
    type: number
    sql: ${TABLE}.AIC ;;
    value_format_name: decimal_4
  }

  dimension: variance {
    type: number
    sql: ${TABLE}.variance ;;
    value_format_name: decimal_4
  }

  dimension: seasonal_periods {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.seasonal_periods, ", ") ;;
  }

  dimension: has_holiday_effect {
    type: string
    sql: ${TABLE}.has_holiday_effect ;;
  }

  dimension: has_spikes_and_dips {
    type: string
    sql: ${TABLE}.has_spikes_and_dips ;;
  }

  dimension: has_step_changes {
    type: string
    sql: ${TABLE}.has_step_changes ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

}

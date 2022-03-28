view: arima_explain_forecast_and_history {

  derived_table: {
    datagroup_trigger: arima_trigger
    sql:
      SELECT *
      FROM ML.EXPLAIN_FORECAST(MODEL ${arima_model.SQL_TABLE_NAME}, STRUCT(2880 AS horizon, 0.99 AS confidence_level))
      ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.property_measured, ${TABLE}.time_series_timestamp) ;;
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

  dimension_group: time_series {
    type: time
    timeframes: [raw, minute, time, date, week, month, year]
    sql: ${TABLE}.time_series_timestamp ;;
    convert_tz: no
  }

  dimension: time_series_type {
    description: "Pivot this. Denotes historic and forecast values."
    type: string
    sql: ${TABLE}.time_series_type ;;
  }

  dimension: time_series_data {
    hidden: yes
    type: number
    sql: ${TABLE}.time_series_data ;;
  }

  dimension: time_series_adjusted_data {
    hidden: yes
    type: number
    sql: ${TABLE}.time_series_adjusted_data ;;
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

  dimension: trend {
    hidden: yes
    type: number
    sql: ${TABLE}.trend ;;
  }

  dimension: seasonal_period_yearly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_yearly ;;
  }

  dimension: seasonal_period_quarterly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_quarterly ;;
  }

  dimension: seasonal_period_monthly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_monthly ;;
  }

  dimension: seasonal_period_weekly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_weekly ;;
  }

  dimension: seasonal_period_daily {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_daily ;;
  }

  dimension: holiday_effect {
    hidden: yes
    type: number
    sql: ${TABLE}.holiday_effect ;;
  }

  dimension: spikes_and_dips {
    hidden: yes
    type: number
    sql: ${TABLE}.spikes_and_dips ;;
  }

  dimension: step_changes {
    hidden: yes
    type: number
    sql: ${TABLE}.step_changes ;;
  }

  measure: count {
    label: "Row Count"
    type: count
  }

  measure: total_time_series_data {
    type: sum
    sql: ${time_series_data} ;;
    value_format_name: decimal_4
  }

  measure: total_time_series_adjusted_data {
    type: sum
    sql: ${time_series_adjusted_data} ;;
    value_format_name: decimal_4
  }

  measure: total_prediction_interval_lower_bound {
    type: number
    sql: SUM(${prediction_interval_lower_bound}) ;;
    value_format_name: decimal_4
  }

  measure: total_prediction_interval_upper_bound {
    type: number
    sql: SUM(${prediction_interval_upper_bound}) ;;
    value_format_name: decimal_4
  }

  measure: total_trend {
    type: sum
    sql: ${trend} ;;
    value_format_name: decimal_4
  }

  measure: total_seasonal_period_yearly {
    type: sum
    sql: ${seasonal_period_yearly} ;;
    value_format_name: decimal_4
  }

  measure: total_seasonal_period_quarterly {
    type: sum
    sql: ${seasonal_period_quarterly} ;;
    value_format_name: decimal_4
  }

  measure: total_seasonal_period_monthly {
    type: sum
    sql: ${seasonal_period_monthly} ;;
    value_format_name: decimal_4
  }

  measure: total_seasonal_period_weekly {
    type: sum
    sql: ${seasonal_period_weekly} ;;
    value_format_name: decimal_4
  }

  measure: total_seasonal_period_daily {
    type: sum
    sql: ${seasonal_period_daily} ;;
    value_format_name: decimal_4
  }

  measure: total_holiday_effect {
    type: sum
    sql: ${holiday_effect} ;;
    value_format_name: decimal_4
  }

  measure: total_spikes_and_dips {
    type: sum
    sql: ${spikes_and_dips} ;;
    value_format_name: decimal_4
  }

  measure: total_step_changes {
    type: sum
    sql: ${step_changes} ;;
    value_format_name: decimal_4
  }

}

view: arima_detect_anomalies {

  derived_table: {
    datagroup_trigger: arima_trigger
    sql:
      SELECT *
      FROM ML.DETECT_ANOMALIES(MODEL ${arima_model.SQL_TABLE_NAME}, STRUCT(0.99 AS anomaly_prob_threshold))
      ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.property_measured, ${TABLE}.timestamp_minutes) ;;
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

  # These dimensions refer to the anomaly prediction values, as well as the corresponding timestamp.

  dimension_group: timestamp {
    type: time
    timeframes: [raw, minute, time, date, week, month, year]
    sql: ${TABLE}.timestamp_minutes ;;
    convert_tz: no
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.minute_value ;;
  }

  dimension: is_anomaly {
    type: yesno
    sql: ${TABLE}.is_anomaly = true ;;
  }

  dimension: lower_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.lower_bound ;;
  }

  dimension: upper_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.upper_bound ;;
  }

  dimension: anomaly_probability {
    type: number
    sql: ${TABLE}.anomaly_probability  ;;
  }

  measure: anomaly_count {
    label: "Count of Anomalies"
    type: count
  }

  measure: total_forecast {
    type: sum
    sql: ${value} ;;
    value_format_name: decimal_4
  }

  measure: total_lower_bound {
    type: sum
    sql: ${lower_bound} ;;
    value_format_name: decimal_4
  }

  measure: total_upper_bound {
    type: sum
    sql: ${upper_bound} ;;
    value_format_name: decimal_4
  }

  measure: is_anomany_numeric {
    label: "Is Anomaly (Numeric)"
    type: sum
    sql: CASE ${TABLE}.is_anomaly
          WHEN true THEN 1
          ELSE 0
         END;;
  }

  measure: anomaly_probability_numeric {
    label: "Anomaly Probability"
    type: average
    sql: ${anomaly_probability} ;;
  }
}

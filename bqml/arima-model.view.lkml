include: "/iot-gas-facilities-demo/measurements.view"

# Training an ARIMA model. Model is rebuilt every day.
# The OPTIONS clause specifies the model parameters, as well as the training data columns.
# The SELECT, FROM and GROUP BY clauses reference the table that the data is taken from, and complete aggregates so that the model can work with minute data.

explore: arima_model {hidden: yes}

view: arima_model {
  derived_table: {
    datagroup_trigger: arima_trigger
    sql_create:
    CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
    OPTIONS
      (model_type = 'ARIMA_PLUS',
       time_series_timestamp_col = 'timestamp_minutes',
       time_series_data_col = 'minute_value',
       time_series_id_col = ['device_id', 'property_measured'],
       data_frequency = 'PER_MINUTE',
       horizon = 2880
      ) AS
    SELECT
      DATETIME_TRUNC(measurements.timestamp, MINUTE) as timestamp_minutes,
      measurements.device_id as device_id,
      measurements.property_measured as property_measured,
      SUM(measurements.value) as minute_value
    FROM ${measurements.SQL_TABLE_NAME} as measurements
    GROUP BY timestamp_minutes, device_id, property_measured;;
  }

  dimension: train_model {
    hidden: yes
    description: "Select this field to train model for the first time"
    type: string
    sql: 'Complete' ;;
  }

}

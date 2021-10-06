# include: "/iot-gas-facilities-demo/measurements.view"
# include: "/facilities-demo.model"

# view: arima_model_training_data {
#   derived_table: {
#     sql_trigger_value: SELECT CURDATE() ;;
#     explore_source: measurements {
#       column: timestamp { field: measurements.timestamp_minute }
#       column: device_id { field: measurements.device_id }
#       column: property_measured { field: measurements.property_measured }
#       column: value { field: measurements.value }

#       filters: {
#         field: measurements.timestamp_minute
#         value: "2021-07-01 00:00:00 to 2021-09-01 00:00:00"
#       }
#     }
#   }

#   dimension_group: timestamp {
#     type: time
#     timeframes: [raw, date, hour, minute, second]
#     sql: ${TABLE}.timestamp ;;
#   }

#   dimension: device_id {
#     type: string
#   }

#   dimension: property_measured {
#     type: string
#   }

#   dimension: value {
#     type: number
#   }
# }

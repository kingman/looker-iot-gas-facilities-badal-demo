connection: "bigquery-looker-sandbox"

include: "/iot-gas-facilities-demo/*.view.lkml"                # include all views in the views/ folder in this project
include: "/dashboards/*.dashboard.lookml"
include: "/bqml/*.view.lkml"

datagroup: arima_trigger {
  sql_trigger: SELECT CURRENT_DATE() ;;
}

explore: measurements {
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore

  # Added an aggregate table to speed up the load time for the "Assets" tile in the System Overview dashboard
  aggregate_table: rollup__assets_asset_id__assets_asset_type__paths_designation__property_measured__3 {
    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
    query: {
      dimensions: [assets.asset_id, assets.asset_type, paths.designation, property_measured]
      measures: [average_value]
      filters: [
        measurements.property_measured: "temperature,pressure,flowrate,density",
        measurements.timestamp_date: "7 day"
      ]
    }
  }

  # DELETE THIS WHEN FINISHED TESTING ACCESS FILTER
  # access_filter: {
  #   field: device_connections.field_meter_tag
  #   user_attribute: field_meters_access
  # }

  join: devices {
   relationship: many_to_one
   sql_on: ${measurements.device_id} = ${devices.device_id} ;;
  }

  join: device_connections {
    view_label: "Assets"
    relationship: one_to_one
    sql_on: ${devices.device_id} = ${device_connections.device_id} ;;
  }

  join: paths {
    view_label: "Assets"
    relationship: one_to_many
    sql_on: ${device_connections.field_meter_tag} = ${paths.field_meter_tag} ;;
  }

  join: assets {
    relationship: many_to_one
    sql_on: ${paths.asset_id} = ${assets.asset_id} ;;
  }

  join: measurements_raw_events {
    relationship: one_to_one
    sql_on: ${measurements.device_id} = ${measurements_raw_events.device_id}
            AND ${measurements.timestamp_raw} = ${measurements_raw_events.timestamp_raw}
            AND ${measurements.property_measured} = ${measurements_raw_events.property_measured};;
  }

  join: events_summary_view {
    relationship: one_to_many
    sql_on: ${devices.device_id} = ${events_summary_view.device_id} ;;
  }

  join: measurements_window_1min {
    relationship: one_to_one
    sql_on: ${measurements.device_id} = ${measurements_window_1min.device_id}
            AND ${measurements.property_measured} = ${measurements_window_1min.property_measured}
            AND ${measurements.timestamp_minute} = ${measurements_window_1min.timestamp_minute};;
  }

  join: measurements_window_10min {
    relationship: one_to_one
    sql_on: ${measurements.device_id} = ${measurements_window_1min.device_id}
            AND ${measurements.property_measured} = ${measurements_window_10min.property_measured}
            AND ${measurements.timestamp_minute} = ${measurements_window_10min.timestamp_minute};;
  }
}

explore: events_summary_view {
  hidden: no
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore
  description: "This explore is for quickly loading event summary info."

  join: device_connections {
    fields: [] # Only using join for the connection
    relationship: many_to_one
    sql_on: ${events_summary_view.device_id} = ${device_connections.device_id} ;;
  }

  join: paths {
    relationship: one_to_many
    sql_on: ${device_connections.field_meter_tag} = ${paths.field_meter_tag} ;;
  }

  join: assets {
    relationship: many_to_one
    sql_on: ${paths.asset_id} = ${assets.asset_id} ;;
  }

  join: measurements_raw_events {
    relationship: one_to_many
    sql_on: ${events_summary_view.event_id} = ${measurements_raw_events.event_id} ;;
  }
}

explore: events_summary_extended {
  hidden: yes
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore
  description: "This explore is for quickly loading event summary info - it does not have liquid syntax so events are aggregated correctly."
}

explore: measurements_raw_events_duration {
  hidden: yes
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore
  description: "This explore is for quickly loading event duration data."
}

explore: shrinkage_view {
  hidden: no
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore
  description: "This explore is for quickly loading shrinkage data."

  join: over_short_view {
    view_label: "Shrinkage View"
    relationship: one_to_one
    sql_on: ${shrinkage_view.compound_primary_key} = ${over_short_view.compound_primary_key} ;;
  }
}
### ARIMA MODEL EXPLORES ###


explore: arima_model_evaluate {
  description: "This explore shows information about the ARIMA models being used."
}

explore: arima_explain_forecast_and_history {
  label: "ARIMA Predictions and Anomaly Detection"

  join: measurements {
    relationship: one_to_one
    sql_on: ${arima_explain_forecast_and_history.device_id} = ${measurements.device_id}
            AND ${arima_explain_forecast_and_history.property_measured} = ${measurements.property_measured}
            AND ${arima_explain_forecast_and_history.time_series_minute} = ${measurements.timestamp_minute}
            ;;
  }

  join: arima_detect_anomalies {
    relationship: one_to_one
    sql_on: ${measurements.device_id} = ${arima_detect_anomalies.device_id}
            AND ${measurements.property_measured} = ${arima_detect_anomalies.property_measured}
            AND ${measurements.timestamp_minute} = ${arima_detect_anomalies.timestamp_minute} ;;
  }
}

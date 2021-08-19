connection: "bigquery-looker-sandbox"

include: "/iot-gas-facilities-demo/*.view.lkml"                # include all views in the views/ folder in this project
include: "/dashboards/*.dashboard.lookml"

explore: measurements {
  persist_for: "0 seconds" #This turns the Looker cache off for queries originating from this explore

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
            AND ${measurements.timestamp_second} = ${measurements_window_1min.timestamp_second};;
  }

  join: measurements_window_10min {
    relationship: one_to_one
    sql_on: ${measurements.device_id} = ${measurements_window_1min.device_id}
            AND ${measurements.property_measured} = ${measurements_window_10min.property_measured}
            AND ${measurements.timestamp_second} = ${measurements_window_10min.timestamp_second};;
  }

  join: shrinkage_view {
    relationship: one_to_many
    sql_on: ${assets.asset_id} = ${shrinkage_view.asset_id} ;;
  }
}

explore: events_summary_view {
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
}

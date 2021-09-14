view: measurements {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.measurements_raw`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.timestamp, ${TABLE}.property_measured) ;;
  }

  dimension: device_id {
    type: string
    hidden: yes
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}.device_version ;;
  }

  dimension: property_measured {
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour,
      minute,
      minute10,
      second
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: units_of_measurement {
    type: string
    sql: ${TABLE}.units_of_measurement ;;
  }

  dimension: value {
    hidden: yes
    type: number
    sql: ${TABLE}.value ;;
  }

### Filter for picking the timefram granularity using the dynamic timeframe dimension

  parameter: timeframe_picker {
    label: "Time Granularity"
    type: string
    allowed_value: { value: "Second" }
    allowed_value: { value: "Minute" }
    allowed_value: { value: "10 Minutes" }
    allowed_value: { value: "Hour" }
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Date"
  }

  dimension: dynamic_timeframe {
    label: "Date/Time"
    type: string
    sql:
      CASE
        WHEN {% parameter timeframe_picker %} = 'Second' THEN CAST(${measurements.timestamp_second} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Minute' THEN CAST(${measurements.timestamp_minute} AS STRING)
        WHEN {% parameter timeframe_picker %} = '10 Minutes' THEN CAST(${measurements.timestamp_minute10} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Hour' THEN CAST(${measurements.timestamp_hour} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${measurements.timestamp_date} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(${measurements.timestamp_week} AS STRING)
        WHEN {% parameter timeframe_picker %} = 'Month' THEN CAST(${measurements.timestamp_month} AS STRING)
      END ;;
  }

  ## Parameter for density unit conversion
  parameter: density_unit_conversion {
    description: "Use with Density Measurement"
    type: string

    allowed_value: {
      label: "kg per cubic meter"
      value: "kg"
    }

    allowed_value: {
      label: "lb per cubic foot"
      value: "lb"
    }
  }

### MEASURES ###

  measure: count_of_measurements {
    type: count
    drill_fields: [devices.device_id]
  }

### NOTE
    # The first case implements the density unit convesion
    # The second case converts the flowrate from m3/hr into E3m3/d (thousand cubic metres per day)
    # 1 m3/d = 0.001 E3m3/d; so 1 m3/hr = 0.024 E3m3/d
    # This is done to convert to a more standard measurement than what is generated in our data

  measure: total_value {
    hidden: no
    type: sum
    value_format_name: decimal_2
    sql:
      CASE
      WHEN ${property_measured} = 'density'
      AND {% parameter density_unit_conversion %} = 'lb'
        THEN ${value}*0.062428
      WHEN ${property_measured} = 'flowrate'
        THEN ${value}*0.024
      ELSE
        ${value}
      END
      ;;
  }

  measure: average_value {
    label: "Average Value per Measurement"
    hidden: no
    type: average
    value_format_name: decimal_2
    sql:
      CASE
      WHEN ${property_measured} = 'density'
      AND {% parameter density_unit_conversion %} = 'lb'
        THEN ${value}*0.062428
      WHEN ${property_measured} = 'flowrate'
        THEN ${value}*0.024
      ELSE
        ${value}
      END
    ;;
  }

  measure: median_value {
    hidden: no
    type: median
    value_format_name: decimal_2
    sql:
    CASE
    WHEN ${property_measured} = 'density'
    AND {% parameter density_unit_conversion %} = 'lb'
      THEN ${value}*0.062428
    WHEN ${property_measured} = 'flowrate'
        THEN ${value}*0.024
    ELSE
      ${value}
    END
    ;;
  }
}


# refinement to the 'measurements' view that creates the period-over-period measures

view: +measurements {

  filter: current_date_range {
    type: date
    view_label: "Period Over Period Measurements"
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    sql: ${period} IS NOT NULL ;;
  }

  parameter: compare_to {
    view_label: "Period Over Period Measurements"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date Range filter"
    label: "2. Compare To:"
    type: unquoted
    allowed_value: {
      label: "Previous Period"
      value: "Period"
    }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }
    default_value: "Period"
  }



## ------------------ HIDDEN HELPER DIMENSIONS  ------------------ ##

  dimension: days_in_period {
    hidden:  yes
    view_label: "Period Over Period Measurements"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATE_DIFF(DATE({% date_end current_date_range %}), DATE({% date_start current_date_range %}), DAY) ;;
  }

  dimension: period_2_start {
    hidden:  yes
    view_label: "Period Over Period Measurements"
    description: "Calculates the start of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL ${days_in_period} DAY)
        {% else %}
        DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL 1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: period_2_end {
    hidden:  yes
    view_label: "Period Over Period Measurements"
    description: "Calculates the end of the previous period"
    type: date
    sql:
        {% if compare_to._parameter_value == "Period" %}
        DATE_SUB(DATE({% date_start current_date_range %}), INTERVAL 1 DAY)
        {% else %}
        DATE_SUB(DATE_SUB(DATE({% date_end current_date_range %}), INTERVAL 1 DAY), INTERVAL 1 {% parameter compare_to %})
        {% endif %};;
  }

  dimension: day_in_period {
    hidden: yes
    view_label: "Period Over Period Measurements"
    description: "Gives the number of days since the start of each period. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
    {% if current_date_range._is_filtered %}
        CASE
        WHEN {% condition current_date_range %} ${timestamp_raw} {% endcondition %}
        THEN DATE_DIFF(${timestamp_date}, DATE({% date_start current_date_range %}), DAY) + 1
        WHEN ${timestamp_date} between ${period_2_start} and ${period_2_end}
        THEN DATE_DIFF(${timestamp_date}, ${period_2_start}, DAY) + 1
        END
    {% else %} NULL
    {% endif %}
    ;;
  }

  dimension: order_for_period {
    hidden: yes
    type: number
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${timestamp_raw} {% endcondition %}
            THEN 1
            WHEN ${timestamp_date} between ${period_2_start} and ${period_2_end}
            THEN 2
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }


## ------------------ DIMENSIONS TO PLOT ------------------ ##

  dimension_group: date_in_period {
    description: "Use this as your grouping dimension when comparing periods. Aligns the previous periods onto the current period"
    label: "Current Period"
    type: time
    sql: DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL (${day_in_period} - 1) DAY);;
    view_label: "Period Over Period Measurements"
    timeframes: [
      date,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month,
      month_name,
      month_num,
      year]
  }


  dimension: period {
    view_label: "Period Over Period Measurements"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    order_by_field: order_for_period
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${timestamp_raw} {% endcondition %}
            THEN 'This {% parameter compare_to %}'
            WHEN ${timestamp_date} between ${period_2_start} and ${period_2_end}
            THEN 'Last {% parameter compare_to %}'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }


## ---------------------- TO CREATE FILTERED MEASURES ---------------------------- ##

  dimension: period_filtered_measures {
    hidden: yes
    view_label: "Period Over Period Measurements"
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} ${timestamp_raw} {% endcondition %} THEN 'this'
            WHEN ${timestamp_date} between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
  }

# Filtered measures

  measure: current_period_litres {
    label: "Current Timeframe m3"
    view_label: "Period Over Period Measurements"
    type: sum
    value_format_name: decimal_2
    sql: ${value};;
    filters: [period_filtered_measures: "this", property_measured: "flowrate"]
  }

  measure: previous_period_litres {
    label: "Previous Timeframe m3"
    view_label: "Period Over Period Measurements"
    type: sum
    value_format_name: decimal_2
    sql: ${value};;
    filters: [period_filtered_measures: "last", property_measured: "flowrate"]
  }

  measure: litres_pop_change {
    view_label: "Period Over Period Measurements"
    label: "Total m3 Period-Over-Period % Change"
    type: number
    sql: CASE WHEN ${current_period_litres} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_litres} / NULLIF(${previous_period_litres} ,0)) - 1 END ;;
    value_format_name: percent_2
  }

}

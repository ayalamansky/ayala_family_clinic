view: visits {
  sql_table_name: family_clinic.visits ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: cast (${service_raw} as varchar) || ${diagnosis_code} || ${patient_id} ;;
  }

  dimension: diagnosis_code {
    type: number
    sql: ${TABLE}.diagnosis_code ;;
  }

  dimension: patient_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.patient_id ;;
  }

  dimension_group: service {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.service_at ;;
    convert_tz: no
  }

  dimension: service_charge {
    type: number
    sql: ${TABLE}.service_charge ;;
  }

  dimension: payout {
    type: number
    sql: ${service_charge}*${insurer.payout_rate_standardized} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [patients.last_name, patients.first_name, patients.id]
  }

  measure: total_service_charge {
    type: sum
    sql: ${service_charge} ;;
    value_format_name: usd
  }

  measure: total_payout {
    type: sum
    sql: ${payout} ;;
    value_format_name: usd
  }
}

view: insurer {
  sql_table_name: family_clinic.insurer ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: (${TABLE}.details::json ->> 'id')::integer ;;
  }

  dimension: id_t2 {
    type: string
    sql: CAST(JSON_EXTRACT_PATH(${TABLE}.details, 'id') AS varchar) ;;
  }

  dimension: payout_rate {
    type: number
    sql: (${TABLE}.details::json ->> 'payout_rate')::numeric ;;
  }

  dimension: payout_rate_t2 {
    type: number
    sql: CAST(JSON_EXTRACT_PATH(${TABLE}.details, 'payout_rate') AS varchar) ;;
  }

  dimension: payout_rate_standardized {
    type: number
    sql: case when ${payout_rate} > 1 then ${payout_rate}*1.0/100 else ${payout_rate} end ;;
    value_format_name: percent_2
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}

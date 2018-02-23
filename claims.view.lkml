view: claims {
  sql_table_name: family_clinic.claims ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: cast(${claim_date} as varchar) || ${diagnosiscode} || ${patientid} ;;
  }

  dimension_group: claim {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.claimdate ;;
    datatype: yyyymmdd
    convert_tz: no
  }

#   dimension: claim_date {
#     type: date
#     datatype: yyyymmdd
#     sql: ${TABLE}.claimdate_at_date_level ;;
#     group_label: "Claim"
#   }


  dimension: diagnosiscode {
    type: number
    sql: ${TABLE}.diagnosiscode ;;
  }

  dimension: insurerid {
    type: number
    value_format_name: id
    sql: ${TABLE}.insurerid ;;
  }

  dimension: insurerorder {
    type: string
    sql: ${TABLE}.insurerorder ;;
  }

  dimension: patientid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.patientid ;;
  }

  measure: count {
    type: count
    drill_fields: [patients.last_name, patients.first_name, patients.id]
  }
}

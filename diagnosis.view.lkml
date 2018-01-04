view: diagnosis {
  sql_table_name: family_clinic.diagnosis ;;

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: diagcode {
    type: number
    sql: ${TABLE}.diagcode ;;
  }

  dimension: diagname {
    type: string
    sql: ${TABLE}.diagname ;;
  }

  dimension: diagtype {
    type: string
    sql: ${TABLE}.diagtype ;;
  }

  dimension: discovery {
    type: string
    sql: ${TABLE}.discovery ;;
  }

  dimension: doctor {
    type: string
    sql: ${TABLE}.doctor ;;
  }

  dimension: hospital {
    type: string
    sql: ${TABLE}.hospital ;;
  }

  dimension: keycode {
    type: string
    sql: ${TABLE}.keycode ;;
  }

  dimension: mod {
    type: string
    sql: ${TABLE}.mod ;;
  }

  dimension: modify {
    type: string
    sql: ${TABLE}.modify ;;
  }

  dimension: pk {
    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: side {
    type: string
    sql: ${TABLE}.side ;;
  }

  dimension: symptom_1 {
    type: string
    sql: ${TABLE}.symptom_1 ;;
  }

  dimension: symptom_2 {
    type: string
    sql: ${TABLE}.symptom_2 ;;
  }

  dimension: test {
    type: string
    sql: ${TABLE}.test ;;
  }

  dimension: u1812983 {
    type: string
    sql: ${TABLE}.u1812983 ;;
  }

  dimension: u1829374 {
    type: string
    sql: ${TABLE}.u1829374 ;;
  }

  dimension: unknown {
    type: string
    sql: ${TABLE}.unknown ;;
  }

  dimension: user1 {
    type: string
    sql: ${TABLE}.user1 ;;
  }

  dimension: user2 {
    type: string
    sql: ${TABLE}.user2 ;;
  }

  dimension: user3 {
    type: string
    sql: ${TABLE}.user3 ;;
  }

  measure: count {
    type: count
    drill_fields: [diagname]
  }
}

connection: "family_clinic"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: visits {
  join: claims {
    relationship: one_to_many
    sql_on: ${claims.patientid} = ${visits.patient_id}
      AND ${claims.diagnosiscode} = ${visits.diagnosis_code}
      AND ${claims.claim_date} = ${visits.service_date};;
  }
  join: insurer {
    relationship: many_to_one
    sql_on: ${claims.insurerid} = ${insurer.id} ;;
  }
  join: patients {
    relationship: many_to_one
    sql_on: ${claims.patientid} = ${patients.id};;
  }
}

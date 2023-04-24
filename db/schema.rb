# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_27_063946) do

  create_table "attachments", force: :cascade do |t|
    t.string "description"
    t.string "document"
    t.integer "prospect_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "service_type"
    t.index ["prospect_id"], name: "index_attachments_on_prospect_id"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "hcs_content"
    t.integer "prospect_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "pay_content"
    t.text "vcp_content"
    t.text "shipping_content"
    t.index ["prospect_id"], name: "index_comments_on_prospect_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "prospects", force: :cascade do |t|
    t.string "organization"
    t.string "street_address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "website"
    t.integer "employees", default: 0
    t.text "hcs_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "intro_presentation_date"
    t.date "hcs_sme_fact_finding_call_date"
    t.decimal "current_health_benefit_cost", default: "0.0", null: false
    t.decimal "new_estimated_health_benefit_cost", default: "0.0", null: false
    t.decimal "savings_percentage", default: "0.0", null: false
    t.string "hcs_opportunity_status"
    t.date "agreement_date"
    t.integer "user_id"
    t.date "hcs_sme_proposal_meeting_date"
    t.string "contact1_first_name"
    t.string "contact1_last_name"
    t.string "contact1_title"
    t.string "contact1_phone"
    t.string "contact1_mobile"
    t.string "contact1_email"
    t.string "contact2_first_name"
    t.string "contact2_last_name"
    t.string "contact2_title"
    t.string "contact2_phone"
    t.string "contact2_mobile"
    t.string "contact2_email"
    t.integer "primary_contact"
    t.string "intro_presenter"
    t.string "hcs_sme"
    t.date "close_date"
    t.date "effective_date"
    t.string "hcbq_business_type"
    t.integer "hcbq_no_of_eligible_employees"
    t.integer "hcbq_total_participation"
    t.string "hcbq_current_carrier"
    t.string "hcbq_current_coverage_type"
    t.text "hcbq_most_important"
    t.string "hcbq_sustainable"
    t.string "hcbq_oop"
    t.text "hcbq_like_best"
    t.text "hcbq_like_least"
    t.integer "hcbq_scale"
    t.text "hcbq_perfect_plan"
    t.text "hcbq_notes"
    t.string "intelatek_bda"
    t.text "intelatek_notes"
    t.string "intelatek_day"
    t.string "intelatek_timezone"
    t.decimal "hcs_monthly_savings_fee", default: "0.0", null: false
    t.decimal "hcs_pepm_fee", default: "0.0", null: false
    t.string "intelatek_time"
    t.boolean "submitted_hcsq", default: false
    t.string "hcs_next_action"
    t.date "hcs_next_action_date"
    t.string "renewal_month"
    t.boolean "hcs_prospect", default: false
    t.boolean "pay_prospect", default: false
    t.date "pay_intro_presentation_date"
    t.string "pay_intro_presenter"
    t.date "pay_sme_presentation_date"
    t.string "pay_sme"
    t.string "pay_status"
    t.date "pay_agreement_date"
    t.integer "pay_hourly_employees", default: 0
    t.date "pay_next_action_date"
    t.string "pay_next_action"
    t.boolean "pay_submitted_to_branch", default: false
    t.date "date_submitted_to_branch"
    t.text "pay_notes"
    t.text "prospect_notes"
    t.string "intelatek_lead_type"
    t.boolean "vcp_prospect", default: false
    t.date "vcp_intro_presentation_date"
    t.string "vcp_intro_presenter"
    t.date "vcp_sme_presentation_date"
    t.date "vcp_supplier_match_meeting_date"
    t.string "vcp_sme"
    t.string "vcp_status"
    t.date "vcp_agreement_date"
    t.date "vcp_next_action_date"
    t.string "vcp_next_action"
    t.text "vcp_notes"
    t.boolean "shipping_prospect", default: false
    t.integer "annual_revenue"
    t.string "shipping_contact_first_name"
    t.string "shipping_contact_last_name"
    t.string "shipping_contact_title"
    t.string "shipping_contact_direct_phone"
    t.string "shipping_contact_mobile"
    t.string "shipping_contact_email"
    t.string "shipping_type"
    t.integer "shipping_annual_parcel_spend"
    t.integer "shipping_annual_ltl_spend"
    t.string "shipping_carrier_provided_system"
    t.string "shipping_interest_in_rate_analysis"
    t.integer "shipping_parcels_per_day"
    t.string "shipping_integration"
    t.text "shipping_notes"
    t.string "shipping_opportunity_status"
    t.string "shipping_lead_status"
    t.date "shipping_next_action_date"
    t.string "shipping_next_action"
    t.string "hcs_lead_status"
    t.string "shipping_parcel_carrier"
    t.integer "shipping_ltl_per_week"
    t.integer "shipping_tl_per_week"
    t.integer "shipping_annual_tl_spend"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "advisor_first_name"
    t.string "advisor_last_name"
    t.boolean "admin", default: false
    t.boolean "manager", default: false
    t.string "advisor_phone"
    t.string "advisor_mobile"
    t.boolean "support", default: false
    t.string "group"
    t.string "gravatar"
    t.string "mailing_address"
    t.string "apt_suite"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.boolean "entrust", default: false
    t.boolean "branch", default: false
    t.string "advisor_company_name"
    t.boolean "intelatek", default: false
    t.string "attachment1"
    t.string "attachment2"
    t.string "attachment3"
    t.string "attachment4"
    t.string "attachment5"
    t.string "attachment6"
    t.string "attachment7"
    t.string "attachment8"
    t.string "attachment9"
    t.string "attachment10"
    t.string "attachment1_name"
    t.string "attachment2_name"
    t.string "attachment3_name"
    t.string "attachment4_name"
    t.string "attachment5_name"
    t.string "attachment6_name"
    t.string "attachment7_name"
    t.string "attachment8_name"
    t.string "attachment9_name"
    t.string "attachment10_name"
    t.date "training_date"
    t.date "business_plan_date"
    t.string "signup_date"
    t.integer "fee"
    t.string "occupation"
    t.string "broker"
    t.string "fee_payment_method"
    t.boolean "staff", default: false
    t.string "advisor_home_phone"
    t.boolean "shipstore", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attachments", "prospects"
  add_foreign_key "attachments", "users"
  add_foreign_key "comments", "prospects"
  add_foreign_key "comments", "users"
end

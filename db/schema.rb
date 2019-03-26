# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190326025842) do

  create_table "comments", force: :cascade do |t|
    t.text     "hcs_content"
    t.integer  "prospect_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "pay_content"
  end

  add_index "comments", ["prospect_id"], name: "index_comments_on_prospect_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "prospects", force: :cascade do |t|
    t.string   "organization"
    t.string   "street_address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "website"
    t.integer  "employees",                         default: 0
    t.text     "hcs_notes"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.date     "intro_presentation_date"
    t.date     "hcs_sme_fact_finding_call_date"
    t.decimal  "current_health_benefit_cost",       default: 0.0,   null: false
    t.decimal  "new_estimated_health_benefit_cost", default: 0.0,   null: false
    t.decimal  "savings_percentage",                default: 0.0,   null: false
    t.string   "status"
    t.date     "agreement_date"
    t.integer  "user_id"
    t.date     "hcs_sme_proposal_meeting_date"
    t.string   "contact1_first_name"
    t.string   "contact1_last_name"
    t.string   "contact1_title"
    t.string   "contact1_phone"
    t.string   "contact1_mobile"
    t.string   "contact1_email"
    t.string   "contact2_first_name"
    t.string   "contact2_last_name"
    t.string   "contact2_title"
    t.string   "contact2_phone"
    t.string   "contact2_mobile"
    t.string   "contact2_email"
    t.integer  "primary_contact"
    t.string   "intro_presenter"
    t.string   "hcs_sme"
    t.date     "close_date"
    t.date     "effective_date"
    t.string   "hcbq_business_type"
    t.integer  "hcbq_no_of_eligible_employees"
    t.integer  "hcbq_total_participation"
    t.string   "hcbq_current_carrier"
    t.string   "hcbq_current_coverage_type"
    t.text     "hcbq_most_important"
    t.string   "hcbq_sustainable"
    t.string   "hcbq_oop"
    t.text     "hcbq_like_best"
    t.text     "hcbq_like_least"
    t.integer  "hcbq_scale"
    t.text     "hcbq_perfect_plan"
    t.text     "hcbq_notes"
    t.string   "intelatek_bda"
    t.text     "intelatek_notes"
    t.string   "intelatek_day"
    t.string   "intelatek_timezone"
    t.decimal  "hcs_monthly_savings_fee",           default: 0.0,   null: false
    t.decimal  "hcs_pepm_fee",                      default: 0.0,   null: false
    t.string   "intelatek_time"
    t.boolean  "submitted_hcsq",                    default: false
    t.string   "hcs_next_action"
    t.date     "hcs_next_action_date"
    t.string   "renewal_month"
    t.boolean  "hcs_prospect",                      default: false
    t.boolean  "pay_prospect",                      default: false
    t.date     "pay_intro_presentation_date"
    t.string   "pay_intro_presenter"
    t.date     "pay_sme_presentation_date"
    t.string   "pay_sme"
    t.string   "pay_status"
    t.date     "pay_agreement_date"
    t.integer  "pay_hourly_employees",              default: 0
    t.date     "pay_next_action_date"
    t.string   "pay_next_action"
    t.boolean  "pay_submitted_to_branch",           default: false
    t.date     "date_submitted_to_branch"
    t.text     "pay_notes"
    t.text     "prospect_notes"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "advisor_first_name"
    t.string   "advisor_last_name"
    t.boolean  "admin",                  default: false
    t.boolean  "manager",                default: false
    t.string   "advisor_phone"
    t.string   "advisor_mobile"
    t.boolean  "support",                default: false
    t.string   "group"
    t.string   "gravatar"
    t.string   "mailing_address"
    t.string   "apt_suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "entrust",                default: false
    t.boolean  "branch",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

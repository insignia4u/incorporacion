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

ActiveRecord::Schema.define(version: 20140114114045) do

  create_table "action_categories", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "action_categories", ["company_id"], name: "index_action_categories_on_company_id"
  add_index "action_categories", ["name"], name: "index_action_categories_on_name", unique: true

  create_table "candidate_actions", force: true do |t|
    t.string   "description"
    t.integer  "action_category_id"
    t.integer  "candidate_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidate_actions", ["action_category_id"], name: "index_candidate_actions_on_action_category_id"
  add_index "candidate_actions", ["candidate_id"], name: "index_candidate_actions_on_candidate_id"
  add_index "candidate_actions", ["user_id"], name: "index_candidate_actions_on_user_id"

  create_table "candidates", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "cv_file_file_name"
    t.string   "cv_file_content_type"
    t.integer  "cv_file_file_size"
    t.datetime "cv_file_updated_at"
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "candidates", ["company_id"], name: "index_candidates_on_company_id"
  add_index "candidates", ["confirmation_token"], name: "index_candidates_on_confirmation_token", unique: true
  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true
  add_index "candidates", ["invitation_token"], name: "index_candidates_on_invitation_token", unique: true
  add_index "candidates", ["invited_by_id"], name: "index_candidates_on_invited_by_id"
  add_index "candidates", ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_candidates", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "task_id"
    t.datetime "completed_on", default: '2014-01-10 14:57:03'
  end

  add_index "task_candidates", ["candidate_id", "task_id"], name: "index_task_candidate", unique: true

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "completed_on"
    t.integer  "training_program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "training_candidates", force: true do |t|
    t.datetime "started_on",          default: '2014-01-09 18:37:02'
    t.datetime "ended_on"
    t.integer  "training_program_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "training_candidates", ["training_program_id", "candidate_id"], name: "index_training_candidate", unique: true

  create_table "training_programs", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
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
    t.integer  "company_id"
    t.boolean  "admin",                  default: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

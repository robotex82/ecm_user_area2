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

ActiveRecord::Schema.define(version: 20151215172130) do

  create_table "ecm_user_area_permissions", force: :cascade do |t|
    t.string   "identifier"
    t.datetime "enabled_from"
    t.datetime "enabled_to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ecm_user_area_role_permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ecm_user_area_role_permissions", ["permission_id"], name: "index_ecm_user_area_role_permissions_on_permission_id"
  add_index "ecm_user_area_role_permissions", ["role_id"], name: "index_ecm_user_area_role_permissions_on_role_id"

  create_table "ecm_user_area_roles", force: :cascade do |t|
    t.string   "identifier"
    t.string   "enabled_from"
    t.string   "enabled_to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ecm_user_area_user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ecm_user_area_user_roles", ["role_id"], name: "index_ecm_user_area_user_roles_on_role_id"
  add_index "ecm_user_area_user_roles", ["user_id"], name: "index_ecm_user_area_user_roles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130317133228) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.integer  "postalcode"
    t.string   "address"
    t.string   "website"
    t.string   "phone_num"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employee_licenses", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "license_id"
    t.date     "acquisition_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "employee_skills", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.integer  "level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "family_name"
    t.string   "given_name"
    t.string   "family_name_kana"
    t.string   "given_name_kana"
    t.integer  "gender"
    t.date     "birthday"
    t.integer  "experience"
    t.date     "entrance_date"
    t.string   "postalcode"
    t.string   "address"
    t.string   "station"
    t.string   "education"
    t.text     "self_pr"
    t.integer  "tech_flg"
    t.integer  "staff_flg"
    t.integer  "del_flg"
    t.integer  "department_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  create_table "licenses", :force => true do |t|
    t.string   "name"
    t.string   "validity_term"
    t.text     "publisher"
    t.text     "note"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login_id"
    t.integer  "employee_id"
    t.integer  "role"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
  end

  add_index "users", ["login_id"], :name => "index_users_on_login_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_details", :force => true do |t|
    t.integer  "work_id"
    t.string   "title"
    t.text     "subject"
    t.text     "role"
    t.text     "work_role"
    t.integer  "work_class"
    t.string   "job_class"
    t.integer  "personnel_num"
    t.date     "period_form"
    t.date     "period_to"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "work_skills", :force => true do |t|
    t.integer  "work_detail_id"
    t.integer  "skill_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "works", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "sales_staff_id"
    t.integer  "customer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end

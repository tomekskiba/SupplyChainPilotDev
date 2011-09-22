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

ActiveRecord::Schema.define(:version => 20110921224956) do

  create_table "admins", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "ancillary_supplies", :force => true do |t|
    t.string    "name"
    t.string    "picture"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "apd_supplies", :force => true do |t|
    t.string    "name"
    t.string    "picture"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "capd_supplies", :force => true do |t|
    t.string    "name"
    t.string    "picture"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "order_ancillary_supply_xrefs", :force => true do |t|
    t.integer   "order_id"
    t.integer   "ancillary_supply_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "order_apd_supply_xrefs", :force => true do |t|
    t.integer   "order_id"
    t.integer   "apd_supply_id"
    t.integer   "on_hand"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "order_capd_supply_xrefs", :force => true do |t|
    t.integer   "order_id"
    t.integer   "capd_supply_id"
    t.integer   "on_hand"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "order_solution_xrefs", :force => true do |t|
    t.integer   "order_id"
    t.integer   "solution_id"
    t.integer   "on_hand"
    t.integer   "usage_per_week"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer   "user_id"
    t.boolean   "submitted_flag"
    t.boolean   "opt_in"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "supplies_counted_at"
  end

  create_table "solutions", :force => true do |t|
    t.decimal   "size"
    t.string    "color"
    t.string    "solution_type"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "seq_no"
  end

  create_table "user_ancillary_supply_xrefs", :force => true do |t|
    t.integer   "user_id"
    t.integer   "ancillary_supply_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_apd_supply_xrefs", :force => true do |t|
    t.integer   "user_id"
    t.integer   "apd_supply_id"
    t.integer   "line_max"
    t.integer   "units_per_cycle"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_capd_supply_xrefs", :force => true do |t|
    t.integer   "user_id"
    t.integer   "capd_supply_id"
    t.integer   "line_max"
    t.integer   "units_per_cycle"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_solution_xrefs", :force => true do |t|
    t.integer   "user_id"
    t.integer   "solution_id"
    t.integer   "line_max"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                  :default => "", :null => false
    t.string    "encrypted_password",      :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.integer   "sign_in_count",                          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.integer   "failed_attempts",                        :default => 0
    t.string    "unlock_token"
    t.timestamp "locked_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "first_name"
    t.string    "last_name"
    t.string    "account_no"
    t.string    "primary_phone"
    t.string    "mobile_phone"
    t.timestamp "delivery_date"
    t.integer   "no_reserved_days"
    t.integer   "no_delivery_cycle_days"
    t.string    "address1"
    t.string    "address2"
    t.string    "city"
    t.string    "state"
    t.string    "postal_code"
    t.string    "caregiver_first_name"
    t.string    "caregiver_last_name"
    t.string    "caregiver_phone"
    t.string    "caregiver_email"
    t.string    "clinic_email"
    t.timestamp "JDE_reconciliation_date"
    t.string    "patient_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end

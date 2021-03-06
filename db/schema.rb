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

ActiveRecord::Schema.define(:version => 20120225225429) do

  create_table "shuttles", :force => true do |t|
    t.datetime "departure_time"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "destination"
  end

  create_table "site_contents", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "username",            :default => "",    :null => false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin",            :default => false, :null => false
    t.boolean  "is_readonly",         :default => true,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shuttle_id"
    t.string   "phone_number"
    t.string   "division"
  end

  add_index "users", ["shuttle_id"], :name => "index_users_on_shuttle_id"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end

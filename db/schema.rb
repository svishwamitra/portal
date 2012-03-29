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

ActiveRecord::Schema.define(:version => 20120322123315) do

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "title",            :limit => 100, :default => ""
    t.string   "street1",          :limit => 100, :default => ""
    t.string   "street2",          :limit => 100, :default => ""
    t.string   "city",             :limit => 50,  :default => ""
    t.string   "state",            :limit => 50,  :default => ""
    t.string   "country",          :limit => 50,  :default => ""
    t.string   "zipcode",          :limit => 6,   :default => ""
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"
  add_index "addresses", ["addressable_type"], :name => "index_addresses_on_addressable_type"

  create_table "company_accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "contacts_count", :default => 0
  end

  create_table "crm_account_contacts", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "crm_contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "matters", :force => true do |t|
    t.string   "name",          :limit => 50
    t.string   "brief",         :limit => 100
    t.string   "matter_no"
    t.string   "ref_no"
    t.text     "description"
    t.date     "matter_date"
    t.boolean  "client_access"
    t.boolean  "is_internal"
    t.integer  "parent_id"
    t.integer  "contact_id"
    t.integer  "account_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "matters_matters", :force => true do |t|
    t.text     "name"
    t.text     "brief"
    t.string   "matter_no"
    t.string   "ref_no"
    t.text     "description"
    t.date     "matter_date"
    t.boolean  "client_access"
    t.boolean  "is_internal"
    t.integer  "parent_id"
    t.integer  "contact_id"
    t.integer  "account_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end

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

ActiveRecord::Schema.define(version: 20140307200913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "signers", force: true do |t|
    t.string   "email"
    t.string   "status"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voter_id"
  end

  create_table "voters", force: true do |t|
    t.integer "vtrid"
    t.string  "lastname"
    t.string  "firstname"
    t.string  "middlename"
    t.string  "suffix"
    t.string  "dob"
    t.string  "gender"
    t.string  "party"
    t.string  "house_number"
    t.string  "house_suffix"
    t.string  "street_predirection"
    t.string  "streetname"
    t.string  "streettype"
    t.string  "street_postdirection"
    t.string  "unittype"
    t.string  "unitnumber"
    t.string  "address"
    t.string  "non_std_address"
    t.string  "residentialcity"
    t.string  "residentialstate"
    t.string  "residentialzip5"
    t.string  "residentialzip4"
    t.string  "mailingaddress"
    t.string  "mailingcity"
    t.string  "mailingstate"
    t.string  "mailingzip5"
    t.string  "mailingzip4"
    t.string  "country"
    t.string  "status_code"
    t.string  "state_registration_date"
    t.string  "county_registration_date"
    t.string  "precinct"
    t.string  "split"
    t.string  "county"
    t.string  "congressional_districts"
    t.string  "legislative_districts"
    t.string  "councilmanic_districts"
    t.string  "ward_districts"
    t.string  "municipal_districts"
    t.string  "commissioner_districts"
    t.string  "school_districts"
  end

  add_index "voters", ["firstname", "lastname", "mailingzip5"], name: "index_voters_on_firstname_and_lastname_and_mailingzip5", using: :btree

end

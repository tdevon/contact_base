# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_22_191927) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "url"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "phone"
    t.json "settings"
    t.integer "label"
    t.integer "company_id"
    t.index ["company_id"], name: "index_contacts_on_company_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contacts_deals", id: false, force: :cascade do |t|
    t.integer "deal_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id"], name: "index_contacts_deals_on_contact_id"
    t.index ["deal_id"], name: "index_contacts_deals_on_deal_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
    t.integer "label"
    t.index ["company_id"], name: "index_deals_on_company_id"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "deals_pipelines", id: false, force: :cascade do |t|
    t.integer "pipeline_id", null: false
    t.integer "deal_id", null: false
    t.index ["deal_id"], name: "index_deals_pipelines_on_deal_id"
    t.index ["pipeline_id"], name: "index_deals_pipelines_on_pipeline_id"
  end

  create_table "pipelines", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_pipelines_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.integer "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "touchpoints", force: :cascade do |t|
    t.text "description"
    t.integer "user_id", null: false
    t.integer "contact_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "interaction_type"
    t.index ["contact_id"], name: "index_touchpoints_on_contact_id"
    t.index ["user_id"], name: "index_touchpoints_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "contacts", "companies"
  add_foreign_key "contacts", "users"
  add_foreign_key "deals", "companies"
  add_foreign_key "deals", "users"
  add_foreign_key "pipelines", "users"
  add_foreign_key "touchpoints", "contacts"
  add_foreign_key "touchpoints", "users"
end

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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 0) do

=======
ActiveRecord::Schema.define(version: 2022_04_04_000912) do

  create_table "user_classifications", charset: "utf8mb4", force: :cascade do |t|
    t.string "user_classification_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "password", limit: 64
    t.string "last_name", limit: 16
    t.string "first_name", limit: 16
    t.string "zipcode", limit: 16
    t.string "prefecture", limit: 16
    t.string "municipality", limit: 16
    t.string "address", limit: 32
    t.string "apartments", limit: 32
    t.string "email", limit: 128
    t.string "phone_number", limit: 16
    t.bigint "user_classification_id"
    t.string "company_name", limit: 128
    t.boolean "delete_flg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_classification_id"], name: "index_users_on_user_classification_id"
  end

  add_foreign_key "users", "user_classifications"
>>>>>>> development
end

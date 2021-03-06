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

ActiveRecord::Schema.define(version: 2021_04_27_111920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.text "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.text "name"
    t.float "amount"
    t.text "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean "liked", default: false
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.text "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists_recipes", force: :cascade do |t|
    t.integer "list_id"
    t.integer "recipe_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "rating"
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.text "name"
    t.integer "prep_time"
    t.text "prep_time_unit"
    t.integer "cooking_time"
    t.text "cooking_time_unit"
    t.integer "difficulty"
    t.text "course"
    t.integer "serving"
    t.text "content"
    t.text "image"
    t.integer "country_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "average_rate"
    t.text "origin"
    t.text "images", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "name"
    t.text "nationality"
    t.date "dob"
    t.text "about"
    t.text "image"
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end

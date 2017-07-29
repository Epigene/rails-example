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

ActiveRecord::Schema.define(version: 20170729101459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "identifier", null: false
    t.text "name", null: false
    t.date "dob", null: false
    t.index ["dob"], name: "index_authors_on_dob"
    t.index ["identifier"], name: "index_authors_on_identifier", unique: true
    t.index ["name"], name: "index_authors_on_name"
  end

  create_table "book_genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id", null: false
    t.integer "genre_id", null: false
    t.index ["book_id", "genre_id"], name: "index_book_genres_on_book_id_and_genre_id", unique: true
    t.index ["book_id"], name: "index_book_genres_on_book_id"
    t.index ["genre_id"], name: "index_book_genres_on_genre_id"
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "identifier", null: false
    t.integer "publisher_id", null: false
    t.integer "author_id", null: false
    t.text "title", null: false
    t.date "published_on", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["identifier"], name: "index_books_on_identifier", unique: true
    t.index ["published_on"], name: "index_books_on_published_on"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
    t.index ["title"], name: "index_books_on_title"
  end

  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "identifier", null: false
    t.index ["identifier"], name: "index_genres_on_identifier", unique: true
  end

  create_table "publishers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name", null: false
    t.index ["name"], name: "index_publishers_on_name", unique: true
  end

end

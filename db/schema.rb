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

ActiveRecord::Schema.define(version: 20180321065623) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "posttime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "headline"
    t.integer "order"
    t.string "url_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.index ["article_id"], name: "index_images_on_article_id"
  end

  create_table "texts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "headline"
    t.integer "order"
    t.string "sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.index ["article_id"], name: "index_texts_on_article_id"
  end

end

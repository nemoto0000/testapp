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

ActiveRecord::Schema.define(:version => 20110531091236) do

  create_table "emails", :force => true do |t|
    t.integer  "uid"
    t.integer  "meetinguid"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid"
    t.integer  "meetinguid"
    t.boolean  "judge"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "pic_big"
    t.string   "religion"
    t.string   "birthday"
    t.string   "birthday_date"
    t.string   "sex"
    t.string   "meeting_sex"
    t.string   "meeting_for"
    t.string   "tv"
    t.string   "movies"
    t.string   "books"
    t.string   "online_presence"
    t.string   "username"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "age"
    t.integer  "toage"
    t.integer  "fromage"
    t.string   "first_name"
    t.integer  "uid"
  end

end

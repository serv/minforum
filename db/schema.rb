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

ActiveRecord::Schema.define(:version => 20120715000659) do

  create_table "flagposts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.boolean  "read",       :default => false
    t.text     "content"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "flagtopics", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.text     "content"
  end

  create_table "forums", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "to_user"
    t.string   "subject"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "recipient"
    t.integer  "read",       :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "posts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "topic_id"
    t.text     "content"
    t.integer  "user_id"
  end

  create_table "states", :force => true do |t|
    t.boolean  "new_message"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "topics", :force => true do |t|
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "forum_id"
    t.string   "name"
    t.integer  "last_post_id"
    t.integer  "views"
    t.integer  "user_id"
    t.boolean  "closed",       :default => false
    t.text     "content"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.text     "bio"
    t.boolean  "mod",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

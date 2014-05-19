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

ActiveRecord::Schema.define(:version => 20120915045724) do

  create_table "add_user_to_projects", :force => true do |t|
    t.string   "add_more_user"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "add_user_to_projects", ["project_id"], :name => "index_add_user_to_projects_on_project_id"
  add_index "add_user_to_projects", ["user_id"], :name => "index_add_user_to_projects_on_user_id"

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "discussions", :force => true do |t|
    t.string   "name"
    t.string   "started_by"
    t.integer  "topic_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "discussion_name"
    t.string   "ancestry"
  end

  add_index "discussions", ["ancestry"], :name => "index_discussions_on_ancestry"
  add_index "discussions", ["discussion_name"], :name => "index_discussions_on_discussion_name"
  add_index "discussions", ["project_id"], :name => "index_discussions_on_project_id"
  add_index "discussions", ["topic_id"], :name => "index_discussions_on_topic_id"
  add_index "discussions", ["user_id"], :name => "index_discussions_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_topics"
    t.string   "project_name"
    t.date     "estimeted_complete_date"
    t.boolean  "done"
    t.string   "resources"
    t.string   "project_manager_name"
    t.float    "cost"
    t.string   "user_id"
    t.string   "text_document"
    t.integer  "dates"
    t.string   "events"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "image"
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "todos", :force => true do |t|
    t.string   "add"
    t.boolean  "visible"
    t.integer  "priority"
    t.integer  "topic_id"
    t.integer  "project_id"
    t.boolean  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "todos", ["project_id"], :name => "index_todos_on_project_id"
  add_index "todos", ["topic_id"], :name => "index_todos_on_topic_id"

  create_table "topics", :force => true do |t|
    t.string   "topic_name"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "topics", ["project_id"], :name => "index_topics_on_project_id"

  create_table "user_records", :force => true do |t|
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "first_name"
    t.string   "#<ActiveRecord::ConnectionAdapters::TableDefinition:0x507bf70>"
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.datetime "birthday"
    t.integer  "phone_no",               :default => 0,  :null => false
    t.string   "location",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20130308015047) do

  create_table "mentors", :force => true do |t|
    t.string   "firstname",  :limit => 25,  :null => false
    t.string   "lastname",   :limit => 25
    t.string   "profile",    :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mentors_topics", :id => false, :force => true do |t|
    t.integer "mentor_id"
    t.integer "topic_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "title",       :limit => 25,  :null => false
    t.string   "description", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

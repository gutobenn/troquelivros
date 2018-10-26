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

ActiveRecord::Schema.define(version: 20181026004410) do

  create_table "book_instances", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.boolean "troca"
    t.boolean "emprestimo"
    t.boolean "doacao"
    t.index ["book_id"], name: "index_book_instances_on_book_id"
    t.index ["user_id"], name: "index_book_instances_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.bigint "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "askingUser_id"
    t.integer "askedUser_id"
    t.integer "askedBook_instance_id"
    t.integer "askingBook_instance_id"
    t.string "type"
    t.string "status"
    t.string "requestDate"
    t.string "returnDate"
    t.string "initialDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["askedBook_instance_id"], name: "index_transactions_on_askedBook_instance_id"
    t.index ["askedUser_id"], name: "index_transactions_on_askedUser_id"
    t.index ["askingBook_instance_id"], name: "index_transactions_on_askingBook_instance_id"
    t.index ["askingUser_id"], name: "index_transactions_on_askingUser_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "addr_street"
    t.string "addr_number"
    t.string "addr_complement"
    t.string "addr_city"
    t.string "phone"
    t.string "addr_state"
    t.float "latitude"
    t.float "longitude"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

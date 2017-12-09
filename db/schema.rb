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

ActiveRecord::Schema.define(version: 20171209035112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answercomments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "puntaje"
    t.index ["answer_id"], name: "index_answercomments_on_answer_id"
    t.index ["user_id"], name: "index_answercomments_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "puntaje"
    t.boolean "best"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comment_answers", force: :cascade do |t|
    t.string "texto"
    t.integer "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_questions", force: :cascade do |t|
    t.string "texto"
    t.integer "puntaje"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facultads", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cant_questions"
    t.boolean "oculto"
  end

  create_table "has_tag_questions", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_has_tag_questions_on_question_id"
    t.index ["tag_id"], name: "index_has_tag_questions_on_tag_id"
  end

  create_table "has_voto_answercomments", force: :cascade do |t|
    t.bigint "answercomment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answercomment_id"], name: "index_has_voto_answercomments_on_answercomment_id"
    t.index ["user_id"], name: "index_has_voto_answercomments_on_user_id"
  end

  create_table "has_voto_answers", force: :cascade do |t|
    t.bigint "answer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_has_voto_answers_on_answer_id"
    t.index ["user_id"], name: "index_has_voto_answers_on_user_id"
  end

  create_table "has_voto_questioncomments", force: :cascade do |t|
    t.bigint "questioncomment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questioncomment_id"], name: "index_has_voto_questioncomments_on_questioncomment_id"
    t.index ["user_id"], name: "index_has_voto_questioncomments_on_user_id"
  end

  create_table "has_voto_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_has_voto_questions_on_question_id"
    t.index ["user_id"], name: "index_has_voto_questions_on_user_id"
  end

  create_table "permisos", force: :cascade do |t|
    t.integer "crearpost"
    t.integer "votarpostivo"
    t.integer "comentar"
    t.integer "votarnegativo"
    t.integer "etiqueta"
    t.integer "facultad"
    t.integer "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questioncomments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "puntaje"
    t.index ["question_id"], name: "index_questioncomments_on_question_id"
    t.index ["user_id"], name: "index_questioncomments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "titulo"
    t.text "texto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "puntaje"
    t.bigint "facultad_id"
    t.integer "visitas"
    t.integer "cant_answers"
    t.index ["facultad_id"], name: "index_questions_on_facultad_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "borrado"
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
    t.string "nombre"
    t.string "apellido"
    t.integer "puntaje"
    t.bigint "facultad_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["facultad_id"], name: "index_users_on_facultad_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answercomments", "answers"
  add_foreign_key "answercomments", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "has_tag_questions", "questions"
  add_foreign_key "has_tag_questions", "tags"
  add_foreign_key "has_voto_answercomments", "answercomments"
  add_foreign_key "has_voto_answercomments", "users"
  add_foreign_key "has_voto_answers", "answers"
  add_foreign_key "has_voto_answers", "users"
  add_foreign_key "has_voto_questioncomments", "questioncomments"
  add_foreign_key "has_voto_questioncomments", "users"
  add_foreign_key "has_voto_questions", "questions"
  add_foreign_key "has_voto_questions", "users"
  add_foreign_key "questioncomments", "questions"
  add_foreign_key "questioncomments", "users"
  add_foreign_key "questions", "facultads"
  add_foreign_key "questions", "users"
  add_foreign_key "users", "facultads"
end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141206135903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: true do |t|
    t.string   "titulo"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  add_index "audios", ["entidade_id"], name: "index_audios_on_entidade_id", using: :btree

  create_table "cursos", force: true do |t|
    t.string   "titulo"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  add_index "cursos", ["entidade_id"], name: "index_cursos_on_entidade_id", using: :btree

  create_table "entidades", force: true do |t|
    t.string   "entidade"
    t.string   "slug"
    t.string   "email"
    t.string   "responsavel"
    t.string   "municipio"
    t.string   "uf"
    t.string   "endereco"
    t.string   "telefone"
    t.text     "descricao"
    t.string   "descritor"
    t.boolean  "telecentro"
    t.boolean  "gesac"
    t.boolean  "ponto_cultura"
    t.boolean  "estudo_cultural"
    t.boolean  "quilombo"
    t.boolean  "quilombo_urbano"
    t.boolean  "capoeira"
    t.boolean  "terreiro"
    t.boolean  "nucleo_formacao"
    t.boolean  "grupo_mestre"
    t.boolean  "radio"
    t.boolean  "estudio"
    t.boolean  "roupa_acessorio"
    t.boolean  "evento"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entidades", ["slug"], name: "index_entidades_on_slug", unique: true, using: :btree

  create_table "fotos", force: true do |t|
    t.string   "titulo"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  add_index "fotos", ["entidade_id"], name: "index_fotos_on_entidade_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "municipios", force: true do |t|
    t.string   "nome"
    t.string   "codigo_ibge"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projetos", force: true do |t|
    t.string   "nome"
    t.string   "convenio"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.string   "categoria"
    t.string   "dificuldade"
    t.string   "impacto"
    t.string   "positivo"
    t.string   "parceiro"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projetos", ["entidade_id"], name: "index_projetos_on_entidade_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "textos", force: true do |t|
    t.string   "titulo"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  add_index "textos", ["entidade_id"], name: "index_textos_on_entidade_id", using: :btree

  create_table "ufs", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "codigo_ibge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "titulo"
    t.integer  "entidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  add_index "videos", ["entidade_id"], name: "index_videos_on_entidade_id", using: :btree

end

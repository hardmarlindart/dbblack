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

ActiveRecord::Schema.define(version: 20150901225843) do

  create_table "dados", force: :cascade do |t|
    t.integer  "tracksegment_id"
    t.string   "nome"
    t.string   "origem"
    t.string   "destino"
    t.string   "mensagem"
    t.string   "hora"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "dados", ["tracksegment_id"], name: "index_dados_on_tracksegment_id"

  create_table "tracksegments", force: :cascade do |t|
    t.integer  "xml_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tracksegments", ["xml_id"], name: "index_tracksegments_on_xml_id"

  create_table "xmls", force: :cascade do |t|
    t.string   "alvo"
    t.string   "nome"
    t.string   "operacao"
    t.integer  "fase"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "gpx_file_name"
    t.string   "gpx_content_type"
    t.integer  "gpx_file_size"
    t.datetime "gpx_updated_at"
  end

end

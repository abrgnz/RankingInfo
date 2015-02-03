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

ActiveRecord::Schema.define(version: 20150203193626) do

  create_table "assignments", force: true do |t|
    t.integer  "trial_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_images", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "generic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "notifications", force: true do |t|
    t.date     "date"
    t.text     "comment"
    t.integer  "trial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.date     "date"
    t.text     "comment"
    t.integer  "trial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "domicilio"
    t.string   "calle"
    t.string   "no_interior"
    t.string   "no_exterior"
    t.string   "colonia"
    t.string   "ciudad"
    t.string   "estado"
    t.string   "codigo_postal"
    t.string   "municipio"
    t.string   "delegacion"
    t.string   "telefono_casa"
    t.string   "telefono_movil"
    t.string   "curp"
    t.string   "ife"
    t.string   "estado_civil"
    t.string   "arrendador_actual"
    t.string   "arrendador_anterior"
    t.string   "domicilio_anterior"
    t.string   "nombre_aval"
    t.string   "domicilio_aval"
    t.string   "telefono_aval"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trials", force: true do |t|
    t.string   "actor_nombre"
    t.string   "actor_apellido_paterno"
    t.string   "actor_apellido_materno"
    t.string   "abogado_patrono_nombre"
    t.string   "abogado_patrono_apellido_paterno"
    t.string   "abogado_patrono_apellido_materno"
    t.string   "demandado_nombre"
    t.string   "demandado_apellido_paterno"
    t.string   "demandado_apellido_materno"
    t.string   "tipo_juicio"
    t.string   "numero_expediente"
    t.string   "juzgado"
    t.string   "distrito_judicial"
    t.string   "ultima_actuacion"
    t.string   "estado_procesal"
    t.date     "fecha_vencimiento_termino"
    t.text     "comentario"
    t.integer  "trial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "privileges"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end

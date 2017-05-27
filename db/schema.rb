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

ActiveRecord::Schema.define(version: 20170315035518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abonos", force: :cascade do |t|
    t.integer  "proveedor_id"
    t.integer  "pedido_id"
    t.float    "monto"
    t.text     "comentario"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "abonos", ["pedido_id"], name: "index_abonos_on_pedido_id", using: :btree
  add_index "abonos", ["proveedor_id"], name: "index_abonos_on_proveedor_id", using: :btree
  add_index "abonos", ["user_id"], name: "index_abonos_on_user_id", using: :btree

  create_table "categoria", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "proveedor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "categoria", ["proveedor_id"], name: "index_categoria_on_proveedor_id", using: :btree

  create_table "categoria_proveedors", force: :cascade do |t|
    t.integer  "proveedor_id"
    t.integer  "categorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categoria_proveedors", ["categorium_id"], name: "index_categoria_proveedors_on_categorium_id", using: :btree
  add_index "categoria_proveedors", ["proveedor_id"], name: "index_categoria_proveedors_on_proveedor_id", using: :btree

  create_table "item_lista", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "listum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "item_lista", ["item_id"], name: "index_item_lista_on_item_id", using: :btree
  add_index "item_lista", ["listum_id"], name: "index_item_lista_on_listum_id", using: :btree

  create_table "item_pedidos", force: :cascade do |t|
    t.string   "nombre"
    t.float    "valor"
    t.boolean  "disponible"
    t.integer  "proveedor_id"
    t.integer  "cantidad"
    t.integer  "item_id"
    t.integer  "estado_actual"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "pedido_id"
  end

  add_index "item_pedidos", ["item_id"], name: "index_item_pedidos_on_item_id", using: :btree
  add_index "item_pedidos", ["pedido_id"], name: "index_item_pedidos_on_pedido_id", using: :btree
  add_index "item_pedidos", ["proveedor_id"], name: "index_item_pedidos_on_proveedor_id", using: :btree

  create_table "item_proveedors", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "proveedor_id"
    t.float    "precio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "item_proveedors", ["item_id"], name: "index_item_proveedors_on_item_id", using: :btree
  add_index "item_proveedors", ["proveedor_id"], name: "index_item_proveedors_on_proveedor_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "categorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "items", ["categorium_id"], name: "index_items_on_categorium_id", using: :btree

  create_table "lista", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "restaurante_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "lista", ["restaurante_id"], name: "index_lista_on_restaurante_id", using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.string   "pedido_hash"
    t.integer  "estado_actual"
    t.integer  "restaurante_id"
    t.datetime "fechahora_solicitada"
    t.datetime "fechahora_estimada"
    t.float    "fee"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pedidos", ["restaurante_id"], name: "index_pedidos_on_restaurante_id", using: :btree

  create_table "proveedors", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.float    "saldo"
    t.float    "cuanto_tarda"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "proveedors", ["user_id"], name: "index_proveedors_on_user_id", using: :btree

  create_table "restaurantes", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurantes", ["user_id"], name: "index_restaurantes_on_user_id", using: :btree

  create_table "transfers", force: :cascade do |t|
    t.text     "memo"
    t.integer  "pedido_id"
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transfers", ["pedido_id"], name: "index_transfers_on_pedido_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "celular"
    t.integer  "rol"
    t.float    "saldo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "abonos", "pedidos"
  add_foreign_key "abonos", "proveedors"
  add_foreign_key "abonos", "users"
  add_foreign_key "categoria", "proveedors"
  add_foreign_key "categoria_proveedors", "categoria"
  add_foreign_key "categoria_proveedors", "proveedors"
  add_foreign_key "item_lista", "items"
  add_foreign_key "item_lista", "lista"
  add_foreign_key "item_pedidos", "items"
  add_foreign_key "item_pedidos", "pedidos"
  add_foreign_key "item_pedidos", "proveedors"
  add_foreign_key "item_proveedors", "items"
  add_foreign_key "item_proveedors", "proveedors"
  add_foreign_key "items", "categoria"
  add_foreign_key "lista", "restaurantes"
  add_foreign_key "pedidos", "restaurantes"
  add_foreign_key "proveedors", "users"
  add_foreign_key "restaurantes", "users"
  add_foreign_key "transfers", "pedidos"
end

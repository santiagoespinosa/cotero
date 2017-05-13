class CreateItemPedidos < ActiveRecord::Migration
  def change
    create_table :item_pedidos do |t|
      t.string :nombre
      t.float :valor
      t.boolean :disponible
      t.references :proveedor, index: true, foreign_key: true
      t.integer :cantidad
      t.references :item, index: true, foreign_key: true
      t.integer :estado_actual

      t.timestamps null: false
    end
  end
end

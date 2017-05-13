class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :pedido_hash
      t.integer :estado_actual
      t.references :restaurante, index: true, foreign_key: true
      t.datetime :fechahora_solicitada
      t.datetime :fechahora_estimada
      t.float :fee

      t.timestamps null: false
    end
  end
end

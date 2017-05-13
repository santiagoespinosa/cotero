class CreateAbonos < ActiveRecord::Migration
  def change
    create_table :abonos do |t|
      t.references :proveedor, index: true, foreign_key: true
      t.references :pedido, index: true, foreign_key: true
      t.float :monto
      t.text :comentario
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

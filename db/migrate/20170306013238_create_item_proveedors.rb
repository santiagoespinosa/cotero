class CreateItemProveedors < ActiveRecord::Migration
  def change
    create_table :item_proveedors do |t|
      t.references :item, index: true, foreign_key: true
      t.references :proveedor, index: true, foreign_key: true
      t.float :precio

      t.timestamps null: false
    end
  end
end

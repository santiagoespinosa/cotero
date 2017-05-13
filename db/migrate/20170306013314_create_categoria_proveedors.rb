class CreateCategoriaProveedors < ActiveRecord::Migration
  def change
    create_table :categoria_proveedors do |t|
      t.references :proveedor, index: true, foreign_key: true
      t.references :categorium, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

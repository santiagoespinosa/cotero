class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.references :user, index: true, foreign_key: true
      t.float :saldo
      t.float :cuanto_tarda

      t.timestamps null: false
    end
  end
end

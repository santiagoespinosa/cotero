class CreateLista < ActiveRecord::Migration
  def change
    create_table :lista do |t|
      t.string :nombre
      t.references :restaurante, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

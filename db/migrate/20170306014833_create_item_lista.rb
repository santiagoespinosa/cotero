class CreateItemLista < ActiveRecord::Migration
  def change
    create_table :item_lista do |t|
      t.references :item, index: true, foreign_key: true
      t.references :listum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

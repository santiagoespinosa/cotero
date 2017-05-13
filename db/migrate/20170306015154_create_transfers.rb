class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.text :memo
      t.references :pedido, index: true, foreign_key: true
      t.integer :from_id
      t.integer :to_id

      t.timestamps null: false
    end
  end
end

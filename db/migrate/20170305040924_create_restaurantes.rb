class CreateRestaurantes < ActiveRecord::Migration
  def change
    create_table :restaurantes do |t|
      t.string :nombre
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

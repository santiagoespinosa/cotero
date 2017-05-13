class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :nombre
      t.references :categorium, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_charger_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_date_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

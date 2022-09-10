class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,               null: false
      t.integer :price,             null: false
      t.integer :category_id,       null: false
      t.text :explanation,          null: false
      t.integer :delivery_tome_id,  null: false
      t.integer :condition_id,      null: false
      t.integer :shipping_fee_id,   null: false
      t.integer :prefectures_id,    null: false
      t.references :user,            null: false, foreign_key: true
    end
  end
end

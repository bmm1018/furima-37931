class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :postal_code,       null: false
      t.integer :prefectures_id,   null: false
      t.string :city,              null: false
      t.string :address,           null: false
      t.string :phone_number,      null: false
      t.string :building
      t.references :buy,           null: false, foreign_key: true
      t.timestamps
    end
  end
end

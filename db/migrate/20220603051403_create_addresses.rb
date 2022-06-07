class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal,       null: false
      t.integer :area_id,     null: false
      t.string :cities,       null: false
      t.string :house_number, null: false
      t.string :building
      t.string :telephone,    null: false
      t.references :item_buy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
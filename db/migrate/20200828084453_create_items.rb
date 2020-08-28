class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.integer :items_status 
      t.integer :user_id 
      t.integer :preparation_day 
      t.integer :postage_payer 
      t.integer :area 
      t.integer :category 
      t.integer :price
      t.timestamps
    end
  end
end

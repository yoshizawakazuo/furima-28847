class CreateSendItems < ActiveRecord::Migration[6.0]
  def change
    create_table :send_items do |t|
      t.string :post_code
      t.integer :stats
      t.string :city
      t.string :address
      t.string :building_number
      t.string :phone_number
      t.integer :buying_id
      t.timestamps
    end
  end
end

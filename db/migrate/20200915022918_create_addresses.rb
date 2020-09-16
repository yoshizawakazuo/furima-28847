class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :area_id,                  null: false
      t.string :city,           default: ""
      t.string :house_number,   default: ""
      t.string :building_name,  default: ""
      t.references :order,             null: false,  foreign_key: true
      t.string :phone_number,          null: false
      t.timestamps
    end
  end
end

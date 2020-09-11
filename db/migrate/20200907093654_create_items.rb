class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name              , null: false
      t.string     :image             , null: false
      t.integer    :category_id       , null: false
      t.integer    :items_status_id   , null: false
      t.integer    :preparation_day_id, null: false
      t.integer    :postage_payer_id  , null: false
      t.integer    :area_id           , null: false
      t.integer    :price             , null: false
      t.text       :info              , null: false
      t.integer    :user_id           , null: false
      t.timestamps
    end
  end
end

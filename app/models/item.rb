class Item < ApplicationRecord

  
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :items_status  
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :area
  belongs_to_active_hash :category
   
  with_options presence: true do
    validates :image
    validates :name
    validates :info 
    validates :price
    validates :items_status
    validates :preparation_day
    validates :postage_payer
    validates :area
    validates :category 
  end

  
  validates_inclusion_of :price, in: 300..10000000 , format: {with: /\A[0-9]+\z/}

  with_options numericality: {other_than: 0} do
    validates :items_status_id   
    validates :preparation_day_id 
    validates :postage_payer_id  
    validates :area_id
    validates :category_id
  end
 

end





class Item < ApplicationRecord

  has_many :comments
  belongs_to :user
  has_one :buying 

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
  validates :price, format: {with: /\A[0-9]+\z/}
  validates_inclusion_of :price, in: 300..9999999

  
  validates :items_status_id,    numericality: { other_than: 0 }
  validates :preparation_day_id, numericality: { other_than: 0 }
  validates :postage_payer_id,   numericality: { other_than: 0 }
  validates :area_id,            numericality: { other_than: 0 }
  validates :category_id,        numericality: { other_than: 0 }
  
 

end





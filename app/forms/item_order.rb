class ItemOrder

  include ActiveModel::Model
  attr_accessor  :postal_code, 
  :area_id, :house_number, :building_name, 
  :phone_number, :city, :token, :item_id, :user_id

  with_options presence: true do
    validates :city
    validates :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{,11}\z/}
  end
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save

    order = Order.create(item_id: item_id, user_id: user_id,)
   
    Address.create(postal_code: postal_code, 
                   area_id: area_id, 
                   city: city, 
                   house_number: house_number, 
                   building_name: building_name,
                   phone_number:phone_number, 
                   order_id: order.id)
    
  end
end
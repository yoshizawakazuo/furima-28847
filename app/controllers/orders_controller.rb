class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @order = ItemOrder.new
  end
  
  

  def create
   
    @order = ItemOrder.new(order_params)
  
    
    if @order.valid?
    pay_item 
      @order.save
      return redirect_to root_path
    else
      render 'index'
     end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:item_order)
          .permit(:postal_code, 
                  :area_id, 
                  :city, 
                  :house_number, 
                  :building_name, 
                  :phone_number,
                  )
          .merge(user_id: current_user.id,
                 item_id: @item.id,
                 token: params[:token]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end
end

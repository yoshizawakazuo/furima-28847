class ItemsController < ApplicationController

  before_action :move_to_index, except:[:index]

  def index
    # @items = Item.all
    # @items = Item.includes(:user).order("created_at DESC")
    
  end
  
  def new
    @item = Item.new
  end
 
  def create
    Item.new(item_params)
  end
 
    private
 
  # def item_params
  #    params.require(:item).permit( :email, :encrypted_password, 
  #     :nickname, :first_name, :last_name, 
  #     :first_name_kana, :last_name_kana, :birth_day, )
  # end
  
  def move_to_index
    unless user_signed_id?
      redirect_to action: :index
    end  
      
  end
end

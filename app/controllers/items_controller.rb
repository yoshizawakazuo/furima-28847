class ItemsController < ApplicationController

  # before_action :move_to_index, except:[:index]
  before_action :authenticate_user!, only: [:new]

  def index
     @items = Item.all
     @items = Item.includes(:user).order("created_at DESC")
    
  end
  
  def new
    @item = Item.new
  end
 
  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save  
      return redirect_to root_path
    else
      render "new"    
    end
  end
 
    private
 
  def item_params
     params.require(:item).permit( 
       :name, 
       :items_status_id, 
       :preparation_day_id, 
       :postage_payer_id, 
       :area_id, 
       :category_id, 
       :price,
       :info,
       :image,
      ) 
      .merge(user_id: current_user.id)
  end
  
  
end

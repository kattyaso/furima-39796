class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @salesrecode_order = SalesrecodeOrder.new
  end

  def new
    
  end
  def create
    
    @salesrecode_order =SalesrecodeOrder.new(order_params)
    
    if @salesrecode_order.valid?
      @salesrecode_order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

 private

    def order_params
      params.require(:salesrecode_order).permit(:postcode, :origin_address_id, :city, :building, :phone_number, :address ).merge(user_id: current_user.id, item_id: params[:item_id])
    end
    def set_item
      @item = Item.find(params[:item_id])
    end
end


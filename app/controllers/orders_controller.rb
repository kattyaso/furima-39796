class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
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
      params.require(:salesrecode_order).permit(:postcode, :origin_address_id, :city, :building, :phone_number, :price, :item_id).merge(user_id: current_user.id)
    end
end


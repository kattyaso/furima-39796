class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item, only: [:index, :create]
  before_action :slect_sold_out_item,only: [:index, :create]
  before_action :self_order,only: [:index, :create]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @salesrecode_order = SalesrecodeOrder.new
  end

  def new
    
  end
  def create
    @salesrecode_order =SalesrecodeOrder.new(order_params)
    if @salesrecode_order.valid?
      pay_item
      @salesrecode_order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

 private
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
      )
    end
    def order_params
      params.require(:salesrecode_order).permit(:postcode, :origin_address_id, :city, :building, :phone_number, :address ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end
    def set_item
      @item = Item.find(params[:item_id])
    end
    def slect_sold_out_item
      if Salesrecode.exists?(item_id: @item.id)
        redirect_to root_path
      end
    end  
    def self_order
      if current_user == @item.user
         redirect_to root_path
      end
    end  
end


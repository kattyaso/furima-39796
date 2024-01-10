class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    @categories = Category.all
    @sales_status = SalesStatus.all
    @fee_status = FeeStatus.all
    @origin_address = Originaddress.all
    @schedule_delivery = ScheduleDelivery.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @categories = Category.all
      @sales_status = SalesStatus.all
      @fee_status = FeeStatus.all
      @origin_address = Originaddress.all
      @schedule_delivery = Scheduledelivery.all
      render :new, status: :unprocessable_entity
    end

  end


  private
  def item_params
    params.require(:item).permit(:item, :description, :category_id, :sales_status_id,:fee_status_id,
    :origin_address_id, :schedule_delivery_id, :price, :image ).merge(user_id: current_user.id)
  end
  def set_item
    @item=item.find(params[:id])
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end





end


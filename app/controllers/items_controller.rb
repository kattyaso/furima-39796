class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new, :edit, :destroy]
  before_action :set_item,only: [:show, :edit, :update, :destroy, :contributor_confirmation]
  before_action :contributor_confirmation, only: [:edit,:update,:destroy]

  def index
    @items=Item.order("created_at DESC")

  end

  def new

    @item = Item.new
    @categories = Category.all
    @sales_status = SalesStatus.all
    @fee_status = FeeStatus.all
    @origin_address = OriginAddress.all
    @schedule_delivery = ScheduleDelivery.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def update

    if  @item.update(item_params)
        redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
    def item_params
      params.require(:item).permit(:item, :description, :category_id, :sales_status_id,:fee_status_id,
      :origin_address_id, :schedule_delivery_id, :price, :image ).merge(user_id: current_user.id)
    end
    def set_item
      @item=Item.find(params[:id])
    end
    def contributor_confirmation
      redirect_to root_path unless current_user == @item.user
    end

  end


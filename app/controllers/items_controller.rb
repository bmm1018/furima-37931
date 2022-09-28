class ItemsController < ApplicationController
  before_action :find_params, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :not_current_user, only: [:edit, :update]
   

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_id, :prefectures_id,
                                 :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def not_current_user
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  def find_params
    @item = Item.find(params[:id])
  end
end

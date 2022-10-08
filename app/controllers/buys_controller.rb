class BuysController < ApplicationController
  before_action :find_params, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
      @buy_profile = BuyProfile.new
  end
  

  def create
    @buy_profile = BuyProfile.new(buy_params)
    if @buy_profile.valid?
      pay_item
      @buy_profile.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def buy_params
    params.require(:buy_profile).permit(:postal_code, :prefectures_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:itam_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @itam.buy != nil
      redirect_to root_path
    end
  end
end

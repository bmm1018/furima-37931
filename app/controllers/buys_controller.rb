class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_profile = BuyProfile.new
  end
  

  def create
    #binding.pry
    @buy_profile = BuyProfile.new(buy_params)
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_8532042e14dc59b45d00d48b"
      Payjp::Charge.create(
        amount: @itemn.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end
end

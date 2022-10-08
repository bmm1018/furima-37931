require 'rails_helper'

RSpec.describe BuyProfile, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @buy_profile = FactoryBot.build(:buy_profile, user_id: @user.id)
    end

    context '内容に問題がない場合' do
      it '全て正しく情報があれば保存ができること' do
        expect(@buy_profile).to be_valid
      end

      it 'buildingは空でも登録できること' do
        @buy_profile.building = ""
        expect(@buy_profile).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @buy_profile.token = nil
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @buy_profile.postal_code = ""
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにはハイフンがないと登録できないこと' do
        @buy_profile.postal_code = "12345678"
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'cityが空では登録できないこと' do
        @buy_profile.city = ""
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @buy_profile.address = ""
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @buy_profile.phone_number = ""
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9文字以下では登録できないこと' do
        @buy_profile.phone_number = "123456789"
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_numberが数字以外が含むと登録できないこと' do
        @buy_profile.phone_number = "123-456-789"
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'prefecturesが空では登録できない' do
        @buy_profile.prefectures_id = 1
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'userが紐づいてないと登録できないこと' do
        @buy_profile.user_id = nil
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録できないこと' do
        @buy_profile.item_id = nil
        @buy_profile.valid?
        expect(@buy_profile.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

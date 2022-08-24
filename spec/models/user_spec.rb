require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
    context 'ユーザ登録できる場合' do
      it 'nicknameとemail, encrypted_password, first_name, first_name_kana, last_name, last_name_kana, birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors_full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors_full_messages).to include("Email can't be blank")
      end
      it 'encrypted_passwordが空では登録できない' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors_full_messages).to include("Encrypted_password can't be blank")
      end
      it 'encrypted_passwordが5文字以下では登録できない' do
        @user.encrypted_password = '00000'
        @user.encrypted_password_confirmation = '00000'
        @user.valid?
        expect(@user.errors_full_messages).to include("Encrypted_password too short(minimum is 6 characters)")
      end
      it 'encrypted_passwordが129文字以上では登録できない' do
        @user.encrypted_password = Faker::Internet.password(min_length: 129)
        @user.encrypted_password_confirmation =@user.passsword
        @user.valid?
        expect(@user.errors_full_messages).to include("Password too long(maximum is 128 characters)")
      end
      it 'encrypted_passwordとencrypted_password_confirmationが不一致では登録できない' do
        @user.encrypted_password = '123456'
        @user.encrypted_password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors_full_messages).to include("Password doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user =FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors_full_messages).to include("Email arleady has been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors_full_messages).to include("Email is invalid")
      end
    end
  end
end

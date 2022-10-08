class BuyProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :phone_number, :building, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :token
    validates :item_id
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: { with: /\A0[0-9]+\z/, message: "is invalid. Input only number"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short"}

  def save

    buy = Buy.create(user_id: user_id, item_id: item_id)

    Profile.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, phone_number: phone_number, building: building, buy_id: buy.id)
  end
end
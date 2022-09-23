class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :prefectures
  belongs_to :shipping_fee
  belongs_to :user
  #has_one :buy
  has_one_attached :image


  validates :name, presence: true
  validates :explanation, presence: true
  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefectures_id
    validates :delivery_time_id
  end
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half characters" }
  validates :image, presence: true
end

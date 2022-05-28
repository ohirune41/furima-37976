class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :payment
  belongs_to :area
  belongs_to :preparation

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :quality_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :payment_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :preparation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
end

class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :item_buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :payment
  belongs_to :area
  belongs_to :preparation

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
                      inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :quality_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :payment_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :preparation_id, numericality: { other_than: 1, message: "can't be blank" }
  end
end

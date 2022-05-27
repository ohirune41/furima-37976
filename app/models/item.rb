class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  vaildates :quality_id, presence: true
  vaildates :payment_id, presence: true
  vaildates :area_id, presence: true
  vaildates :preparation_id, presence: true
  vaildates :price, presence: true
end

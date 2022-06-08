class ItemBuyForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postal, :area_id, :cities, :house_number, :building, :telephone

  with_options presence: true do
    validates :token
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :cities
    validates :house_number
    validates :telephone, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'number is too short' }
    validates :item_id
    validates :user_id
  end

  def save
    item_buy = ItemBuy.create(item_id: item_id, user_id: user_id)
    Address.create(postal: postal, area_id: area_id, cities: cities, house_number: house_number, building: building,
                   telephone: telephone, item_buy_id: item_buy.id)
  end
end

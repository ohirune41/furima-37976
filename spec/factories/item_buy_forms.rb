FactoryBot.define do
  factory :item_buy_form do
    token                 { 'tok_abcdefghijk00000000000000000' }
    postal                { '111-1111' }
    area_id               { Faker::Number.between(from: 2, to: 48) }
    cities                { Faker::Address.city }
    house_number          { Faker::Address.street_address }
    building              { '建物' }
    telephone             { "0700#{rand(0..9)}#{rand(10_000..999_999)}" }
  end
end

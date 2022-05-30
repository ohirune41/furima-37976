FactoryBot.define do
  factory :item do
    item_name         {Faker::Team.name}
    explanation       {Faker::Lorem.sentence}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    quality_id        {Faker::Number.between(from: 2, to: 7)}
    payment_id        {Faker::Number.between(from: 2, to: 3)}
    area_id           {Faker::Number.between(from: 2, to: 48)}
    preparation_id    {Faker::Number.between(from: 2, to: 4)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end

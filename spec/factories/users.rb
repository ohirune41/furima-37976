FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    gimei = Gimei.name
    last_name             { gimei.last }
    first_name            { gimei.first }
    last_name_katakana    { gimei.last.katakana }
    first_name_katakana   { gimei.first.katakana }
    birth_day             { Faker::Date.backward }
  end
end

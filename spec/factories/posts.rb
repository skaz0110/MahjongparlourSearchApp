FactoryBot.define do

  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    postalcode { Faker::Address.zip }
    prefecturecode{ Faker::Number.within(range: 1..47) }
    address1{ Faker::Address.city }
    address2{ Faker::Address.street_name }
    phonenumber{ Faker::PhoneNumber.phone_number }
    user
  end

  trait :invalid do
    title { nil }
  end
end
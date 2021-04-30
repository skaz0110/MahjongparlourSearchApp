FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    content { Faker::Lorem.paragraph }
  end

  trait :contactinvalid do
    email { nil }
  end
end
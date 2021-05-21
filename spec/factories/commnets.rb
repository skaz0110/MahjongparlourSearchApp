FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    user
    post
  end

  trait :commentinvalid do
    content { nil }
  end
end

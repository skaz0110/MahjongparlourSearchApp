FactoryBot.define do
  factory :review do
    content { Faker::Lorem.paragraph }
    star    { 0.5 }
    user
    post
  end
end

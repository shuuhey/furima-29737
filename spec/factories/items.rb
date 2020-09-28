FactoryBot.define do
  factory :item do
    name           { Faker::Lorem.words(number: 4) }
    description    { Faker::Lorem.words(number: 30) }
    price          { '3000' }
    category_id    { '3' }
    condition_id   { '3' }
    delivery_id    { '3' }
    preparation_id { '3' }
    prefecture_id  { '3' }
    association :user
  end
end

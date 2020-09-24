FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '塩田' }
    first_name            { '周平' }
    family_name_kana      { 'シオタ' }
    first_name_kana       { 'シュウヘイ' }
    birth_day             { '1930-01-01' }
  end
end

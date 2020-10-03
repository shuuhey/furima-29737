FactoryBot.define do
  factory :order_address do
    token         { 'tok1234'}
    postal_code   { '331-0064' }
    prefecture_id { '4' }
    city          { '埼玉' }
    house_number  { '大宮' }
    building_name { 'レジデンス101' }
    phone_number  { '09012341234' }
  end
end
FactoryBot.define do
  factory :order_delivery do
    postal_code { '123-4567' }
    prefecture_id {2}
    city { '東京都渋谷区' }
    street_address { '渋谷1-1' }
    building_name { '東京ビル' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

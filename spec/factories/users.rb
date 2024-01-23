FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username(specifier: 5..15) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }    
    password_confirmation { password }
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    last_name_kana        { Faker::Japanese::Name.last_name.yomi }
    first_name_kana       { Faker::Japanese::Name.first_name.yomi }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end

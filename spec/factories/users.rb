FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gender_id             { 1 }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
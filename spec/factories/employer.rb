FactoryBot.define do
  factory :employer do
    association :profile
      employment  { Faker::Name.name }
      start_date { Faker::Date.in_date_period }
      end_date { Faker::Date.in_date_period }
    end
  end
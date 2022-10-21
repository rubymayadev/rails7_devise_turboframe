FactoryBot.define do
  factory :profile do
      first_name  { Faker::Name.name }
      last_name  { Faker::Name.name }
      nick_name { Faker::Address.full_address }
      email_address { Faker::Internet.safe_email }
      phone_number { "123-456-9876" }
    end
  end
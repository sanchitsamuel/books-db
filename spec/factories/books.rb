FactoryBot.define do
  factory :book do
    author_last_name { Faker::Name.last_name }
    author_first_name { Faker::Name.first_name }
    title { Faker::Book.title }
    price { rand(1.0..1000.0).round(2) }
    publisher { Faker::Company.name }
  end
end

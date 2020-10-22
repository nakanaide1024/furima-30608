FactoryBot.define do
  factory :product do
    name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from:2, to:11)}
    condition_id {Faker::Number.between(from:2, to:7)}
    delivery_charger_id {Faker::Number.between(from:2, to:3)}
    delivery_date_id {Faker::Number.between(from:2, to:4)}
    prefecture_id {Faker::Number.between(from:2, to:48)}
    price {Faker::Number.between(from:300, to:9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

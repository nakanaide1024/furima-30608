FactoryBot.define do
  factory :buyer_address do
    post_code {"123-4567"}
    prefecture_id { Faker::Number.between(from: 2, to: 48)}
    city {"武蔵野市"}
    house_number {"1-1-1"}
    phon_number {"12345678901"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

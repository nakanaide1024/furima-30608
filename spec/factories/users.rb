FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    first_name { Gimei.name.first.kanji }
    last_name { Gimei.name.last.kanji }
    first_name_kana { Gimei.name.first.katakana }
    last_name_kana { Gimei.name.last.katakana }
    birth_date { Faker::Date.birthday(max_age: 90) }
  end
end

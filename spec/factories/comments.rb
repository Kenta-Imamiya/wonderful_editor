FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.characters(number: 30) }
    user #userモデルとの関連付け
    article #articleモデルとの関連付け
  end
end

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 30) }
    user #userモデルとの関連付け
  end
end

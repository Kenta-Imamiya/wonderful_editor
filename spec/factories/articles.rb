FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 30) }
    body { Faker::Lorem.sentence }
    user # userモデルとの関連付け
  end
end

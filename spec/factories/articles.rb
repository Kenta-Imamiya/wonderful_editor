FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 30) }
    body { Faker::Lorem.sentence }
    user # userモデルとの関連付け

    trait :draft do
      status { 1 }
    end

    trait :published do
      status { 0 }
    end
  end
end

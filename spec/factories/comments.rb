FactoryBot.define do
  factory :comment do
    id { "" }
    body { "MyText" }
    user_id { "" }
    article_id { "" }
  end
end

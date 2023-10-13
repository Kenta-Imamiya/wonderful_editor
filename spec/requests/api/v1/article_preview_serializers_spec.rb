require "rails_helper"

# RSpec.describe "Api::V1::ArticlePreviewSerializers", type: :request do
#   describe "GET /api/v1/article_preview_serializers" do
#     it "returns a serialized list of items" do
#       articles = 5.times.map { FactoryBot.build(:article) }

#       get '/api/v1/articles' => 'api/v1/base_api#index'

#       expect(response).to have_http_status(200)

#       # レスポンスのJSONをパース
#       json_response = JSON.parse(response.body)

#       # シリアライザによるデータの検証
#       expect(json_response.length).to eq(5) # シリアライズされたアイテムの数
#       expect(json_response[0]['title']).to eq(items[0].title) # シリアライザが'name'を正しく処理していることを確認
#       # 他のフィールドについても同様に検証を行う
#     end
#   end
# end

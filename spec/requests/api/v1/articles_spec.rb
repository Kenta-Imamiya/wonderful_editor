require "rails_helper"

RSpec.describe "Api::V1::Articles" do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    let!(:recently_updated_article) { create(:article, updated_at: 1.days.ago) }
    let!(:older_updated_article) { create(:article, updated_at: 2.days.ago) }
    let!(:newest_article) { create(:article) }
    # 下記コードはRubocopでエラー
    # let!(:article1) { create(:article, updated_at: 1.days.ago) }
    # let!(:article2) { create(:article, updated_at: 2.days.ago) }
    # let!(:article3) { create(:article) }

    it "記事の一覧が取得できる" do
      subject

      expect(response).to have_http_status(:ok)
    end

    it "記事の一覧のオブジェクトが3つ" do
      subject
      res = response.parsed_body

      expect(res.length).to eq 3
    end

    it "記事の一覧が降順になっている" do
      subject
      res = response.parsed_body

      expect(res.pluck("id")).to eq [newest_article.id, recently_updated_article.id, older_updated_article.id]
    end

    it "記事の一覧の最初のarticleに含まれる属性(keys)が正しい" do
      subject
      res = response.parsed_body

      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
    end

    it "記事の一覧の最初のarticleに関連するuserの属性(keys)が正しい" do
      subject
      res = response.parsed_body

      expect(res[0]["user"].keys).to eq ["id", "name", "email"]
    end

    # 下記のコードだとRubocopでテストケースを分けるようエラーになる。

    # it "記事の一覧が取得できる" do
    #   subject
    #   res = response.parsed_body

    #   expect(response).to have_http_status(:ok)
    #   expect(res.length).to eq 3
    #   expect(res.pluck("id")).to eq [newest_article.id, recently_updated_article.id, older_updated_article.id]
    #   expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
    #   expect(res[0]["user"].keys).to eq ["id", "name", "email"]
    # end
  end
end

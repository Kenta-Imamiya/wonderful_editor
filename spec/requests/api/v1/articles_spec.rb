require "rails_helper"

RSpec.describe "Api::V1::Articles" do
  describe "GET /articles" do
    subject { get(api_v1_articles_path) }

    let!(:recently_updated_article) { create(:article, updated_at: 1.days.ago) }
    let!(:older_updated_article) { create(:article, updated_at: 2.days.ago) }
    let!(:newest_article) { create(:article) }

    context "記事が存在する場合" do
      it "記事の一覧が取得できる" do
        subject
        res = response.parsed_body

        expect(response).to have_http_status(:ok)
        expect(res.length).to eq 3
        expect(res.pluck("id")).to eq [newest_article.id, recently_updated_article.id, older_updated_article.id]
        expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
        expect(res[0]["user"].keys).to eq ["id", "name", "email"]
      end
    end
  end

  describe "GET /articles/:id" do
    subject { get(api_v1_article_path(article.id)) }

    context "指定した id の記事が存在する場合" do
      let(:article) { create(:article) }

      it "記事の詳細が取得できる" do
        subject
        res = response.parsed_body

        expect(response).to have_http_status(:ok)
        expect(res["id"]).to eq article.id
        expect(res["title"]).to eq article.title
        expect(res["body"]).to eq article.body
        expect(res["updated_at"]).to be_present
        expect(res["user"]["id"]).to eq article.user.id
        expect(res["user"].keys).to eq ["id", "name", "email"]
      end
    end

    context "指定した id の記事が存在しない場合" do
      let(:article) { create(:article, id: 10000) }
      # let(:article_id) { 10000 }

      it "記事が見つからない" do
        # expect { subject }.to raise_error ActiveRecord::RecordNotFound
        expect { get(api_v1_article_path(article.id[10000])) }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "post /articles" do
    subject { post(api_v1_articles_path, params:) }

    let(:params) { { article: attributes_for(:article) } }
    let(:current_user) { create(:user) }

    # stub
    before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

    it "記事のレコードが作成できる" do
      expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
      res = response.parsed_body
      expect(res["title"]).to eq params[:article][:title]
      expect(res["body"]).to eq params[:article][:body]
      expect(response).to have_http_status(:ok)
    end
  end
end

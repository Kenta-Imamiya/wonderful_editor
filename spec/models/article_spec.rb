require "rails_helper"

RSpec.describe Article do
  context "title を指定しているとき" do
    let(:user) { build(:user) }
    let(:article) { build(:article) }

    it "投稿が作られる" do
      expect(article).to be_valid
    end
  end

  context "title を指定していないとき" do
    let(:user) { build(:user) }
    let(:article) { build(:article, title: nil) }

    it "エラーになる" do
      expect(article).not_to be_valid
    end
  end

  # 以下、リファクタリング前

  # context "title を指定しているとき" do
  #   it "投稿が作られる" do
  #     user = User.create(id: "1", uid: "1", name: "foo", provider: "foo@example.com", password: "foofoo")
  #     article = Article.new(title: "foo", user_id: "1")
  #     expect(article.valid?).to eq true
  #   end
  # end

  # context "title を指定していないとき" do
  #   it "投稿作成に失敗する" do
  #     user = User.create(id: "1", uid: "1", name: "foo", provider: "foo@example.com", password: "foofoo")
  #     article = Article.new(title: "", user_id: "1")
  #     expect(article.valid?).to eq false
  #   end
  # end
end

require "rails_helper"

RSpec.describe Article, type: :model do
  context "title を指定しているとき" do
    it "投稿が作られる" do
      article = Article.new(title: "foo")
      expect(article.valid?).to eq true
    end
  end

  context "title を指定していないとき" do
    it "投稿作成に失敗する" do
    end
  end
end

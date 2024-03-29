require "rails_helper"

RSpec.describe Comment do
  context "commentに入力されているとき" do
    let(:user) { build(:user) }
    let(:article) { build(:article) }
    let(:comment) { build(:comment) }

    it "commentを作成する" do
      expect(comment).to be_valid
    end
  end

  context "commentに入力がないとき" do
    let(:user) { build(:user) }
    let(:article) { build(:article) }
    let(:comment) { build(:comment, body: nil) }

    it "エラーになる" do
      expect(comment).not_to be_valid
    end
  end
end

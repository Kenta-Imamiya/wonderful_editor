require 'rails_helper'

RSpec.describe User, type: :model do

  context "必要な情報が揃っている場合" do
    let(:user) { build(:user) }

    it "ユーザー登録できる" do
      expect(user).to be_valid
    end
  end

  context "名前のみ入力している場合" do
    let(:user) { build(:user, email: nil, password: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end

  context "emailがない場合" do
    let(:user) { build(:user, email: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end

  context "passwordがない場合" do
    let(:user) { build(:user, password: nil) }

    it "エラーが発生する" do
      expect(user).not_to be_valid
    end
  end


  # 以下、自分で検討したコード

  # context "必要事項に入力あり" do
  #   it "ユーザーを作成する" do
  #      user = FactoryBot.build(:user)
  #      expect(user).to be_valid
  #    end
  #  end

  #  context "name に入力なし" do
  #   it "ユーザーを作成しない" do
  #     user = FactoryBot.build(:user, name: "")
  #     expect(user).to be_invalid
  #     expect(user.errors.details[:name][0][:error]).to eq :blank
  #   end
  # end

  #  context "uid に入力なし" do
  #   it "ユーザーを作成しない" do
  #     user = User.new(uid: "", name: "foo", provider: "foo@example.com", password: "foofoo")
  #     expect(user).to be_invalid
  #     expect(user.errors.details[:uid][0][:error]).to eq :blank
  #   end
  # end
  # # FactoryBotでuserを作成するとuidがnilでも上記のエラーは発生しない。

  # context "必要事項に入力あり" do
  #  it "ユーザーを作成する" do
  #     binding.pry
  #     user = User.new(uid: "1", name: "foo", provider: "foo@example.com", password: "foofoo")
  #     expect(user).to be_valid
  #   end
  # end

  # context "name に入力なし" do
  #   it "ユーザーを作成しない" do
  #     user = User.new(uid: "1", name: "", provider: "foo@example.com", password: "foofoo")
  #     expect(user).to be_invalid
  #     expect(user.errors.details[:name][0][:error]).to eq :blank
  #   end
  # end

  # context "provider に入力なし" do
  #   it "ユーザーを作成する" do
  #     user = User.new(uid: "1", name: "foo", provider: "", password: "foofoo")
  #     expect(user).to be_valid
  #   end
  # end

  # context "password に入力なし" do
  #   it "ユーザーを作成する" do
  #     user = User.new(uid: "1", name: "foo", provider: "foo@example.com", password: "")
  #     expect(user).to be_valid
  #   end
  # end

  # context "すでに同じ名前の name が存在しているとき" do
  #   fit "ユーザーを作成しない" do
  #     User.create!(uid: "1", name: "foo", provider: "foo@example.com", password: "foofoo")
  #     user = User.new(uid: "2", name: "foo", provider: "fuu@example.com", password: "foofoo")
  #     binding.pry
  #     expect(user).to be_invalid
  #   end
  # end

end

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy

  validates :title, presence: true

  enum status: { published: 0, draft: 1 }

  def active_model_serializer
    Api::V1::ArticlePreviewSerializer
  end
end

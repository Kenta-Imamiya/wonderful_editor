class AddStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :integer, default: 1, null: false
  end
end

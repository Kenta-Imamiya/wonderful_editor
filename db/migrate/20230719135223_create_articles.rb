class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.bigint :id
      t.string :title
      t.text :body
      t.bigint :user_id

      t.timestamps
    end
  end
end

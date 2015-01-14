class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.json "response"
      t.datetime "published_at"
      t.string "article_id"
    end
  end
end

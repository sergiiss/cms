class AddColumnsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :title, :string
    add_column :articles, :description, :string
    add_column :articles, :slug, :string
    add_column :articles, :menu_label, :string
    add_column :articles, :h1, :string
    add_column :articles, :content, :text
    add_column :articles, :published_at, :datetime
    add_column :articles, :priority, :integer
  end
end

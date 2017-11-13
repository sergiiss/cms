class Article < ApplicationRecord
  extend FriendlyId

  friendly_id :slug, use: :slugged

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  validates :title, :description, :slug, :menu_label, :h1, :content, :published_at, presence: true
end

class Article < ApplicationRecord
  extend FriendlyId

  before_save :edit_for_utc

  friendly_id :slug, use: :slugged

  validates :title, :description, :slug, :menu_label, :h1, :content, :published_at, presence: true

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def edit_for_utc
    self.published_at -= 10800
  end
end

class Article < ApplicationRecord
  extend FriendlyId

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png", size: { less_than: 1.megabyte },
    url: "/system/:hash.:extension", hash_secret: "longSecretsString"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


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

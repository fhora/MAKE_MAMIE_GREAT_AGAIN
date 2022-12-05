class Mission < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :mission_candidates, dependent: :destroy

  has_rich_text :content
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :reward_cents, presence: true, numericality: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  acts_as_taggable_on :categories

  pg_search_scope :search_by_title,
                  against: %i[title],
                  using: {
                    tsearch: { prefix: true }
                  }

  CATEGORIES = %w[shopping walking medical reading playing discussing]
  ICONS = [
    "fa-solid fa-cart-shopping",
    "fa-solid fa-person-walking",
    "fa-solid fa-notes-medical",
    "fa-solid fa-book-open",
    "fa-solid fa-puzzle-piece",
    "fa-regular fa-comment"
  ]
end

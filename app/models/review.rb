class Review < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true, numericality: { in: (0..5) }
end

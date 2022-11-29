class Mission < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :reward_cents, presence: true, numericality: true
  validates :location, presence: true
end

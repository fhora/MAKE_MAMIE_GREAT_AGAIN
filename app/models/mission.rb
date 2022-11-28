class Mission < ApplicationRecord
  belongs_to :user
  has_many :mission_candidates
  has_many :users, through: :mission_candidates
end

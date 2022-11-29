class MissionCandidate < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  # has_one :mission, dependent: :destroy
end

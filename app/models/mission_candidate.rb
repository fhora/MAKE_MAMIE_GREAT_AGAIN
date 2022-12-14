class MissionCandidate < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_many :chatrooms, dependent: :destroy
  # has_one :mission, dependent: :destroy

  scope :accepted, -> { where(status: "Accepted") }
  scope :waiting, -> { where(status: "waiting") }
end

class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :mission_candidate
end

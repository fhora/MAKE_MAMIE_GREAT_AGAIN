class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mission_candidates
  has_many :missions, through: :mission_candidates
  has_many :missions
  validates :first_name, presence: true, format: { without: /[0-9]/ }
  validates :last_name, presence: true, format: { without: /[0-9]/ }
  validates :phone_number, phone: { possible: true, allow_blank: true }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :missions, through: :mission_candidates, dependent: :destroy
  has_many :mission_candidates, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  validates :first_name, presence: true, format: { without: /[0-9]/ }
  validates :last_name, presence: true, format: { without: /[0-9]/ }
  # validates :phone_number, phone: { possible: true, allow_blank: true }

  def fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end

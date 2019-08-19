class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plants
  has_many :bookings
  has_many :plants, through: :bookings
  has_many :reviews, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :plants, through: :wishes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
end

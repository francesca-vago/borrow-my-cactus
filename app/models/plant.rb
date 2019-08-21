class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :wishes, dependent: :destroy
  validates :name, presence: true
  validates :daily_price, presence: true
end

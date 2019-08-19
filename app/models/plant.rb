class Plant < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :daily_price, presence: true
end

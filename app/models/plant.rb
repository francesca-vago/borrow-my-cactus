class Plant < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :address ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :wishes, dependent: :destroy
  validates :name, presence: true
  validates :daily_price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

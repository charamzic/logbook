class Trip < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :user_id, presence: true
  validates :fuel_price_override, numericality: { greater_than: 0 }, allow_blank: true
  validates :vehicle_id, presence: true
  validates :origin, presence: true
  validates :destination, presence: true

  attr_accessor :fuel_price_override
end

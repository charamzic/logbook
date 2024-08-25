class FuelType < ApplicationRecord
  validates :name, presence: true
  validates :price_per_liter, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

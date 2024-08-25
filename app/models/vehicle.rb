class Vehicle < ApplicationRecord
  belongs_to :fuel_type
  belongs_to :user
  has_many :trips

  before_destroy :ensure_no_trips

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :fuel_consumption, numericality: { greater_than: 0 }, allow_blank: false
  validates :total_km, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :fuel_type_id, presence: true


  private

  def ensure_no_trips
    if trips.any?
      errors.add(:base, "Není možné smazat vozidlo, které je přiřazené k některé z cest.")
      throw(:abort)
    end
  end
end

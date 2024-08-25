# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

FuelType.destroy_all
Vehicle.destroy_all
Trip.destroy_all

petrol = FuelType.create(name: "Natural 95", price_per_liter: 37.67)
racing = FuelType.create(name: "Shell V Power Racing 100", price_per_liter: 45.05)

v1 = Vehicle.create(name: "CFM CLX 700 Sport", fuel_consumption: 5.6, total_km: 7900, fuel_type: petrol)
v2 = Vehicle.create(name: "Subaru BRZ", fuel_consumption: 7.3, total_km: 13234, fuel_type: racing)

Trip.create(origin: "Praha", destination: "Brno", vehicle: v1, distance: 207, costs: 50.00)
Trip.create(origin: "Praha", destination: "Brno", vehicle: v2, distance: 207, costs: 50.00)
Trip.create(origin: "Praha", destination: "Brno", vehicle: v2, distance: 207, costs: 50.00)

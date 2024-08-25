json.extract! vehicle, :id, :name, :fuel_consumption, :total_km, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)

json.extract! trip, :id, :origin, :destination, :vehicle, :distance, :costs, :created_at, :updated_at
json.url trip_url(trip, format: :json)

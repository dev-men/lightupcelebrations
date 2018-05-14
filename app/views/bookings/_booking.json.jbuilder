json.extract! booking, :id, :day, :start, :end, :location, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)

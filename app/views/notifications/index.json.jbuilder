json.array!(@notifications) do |notification|
  json.extract! notification, :id, :date, :comment
  json.url notification_url(notification, format: :json)
end

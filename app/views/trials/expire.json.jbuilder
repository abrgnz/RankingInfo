json.array!(@trials) do |trial|
  json.extract! trial, :id, :starts_at
  json.url trial_url(trial, format: :json)
end

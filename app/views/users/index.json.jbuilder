json.array!(@users) do |user|
  json.extract! user, :id, :username, :search
  json.url user_url(user, format: :json)
end

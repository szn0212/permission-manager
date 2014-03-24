json.array!(@users) do |user|
  json.extract! user, :id, :account_id, :nickname, :sex
  json.url user_url(user, format: :json)
end

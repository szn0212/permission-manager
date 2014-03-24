json.array!(@tasks) do |task|
  json.extract! task, :id, :content, :account_id
  json.url task_url(task, format: :json)
end

json.array!(@settings) do |setting|
  json.extract! setting, :id, :user_id, :wait_time
  json.url setting_url(setting, format: :json)
end

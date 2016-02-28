json.array!(@procmodes) do |procmode|
  json.extract! procmode, :id, :name
  json.url procmode_url(procmode, format: :json)
end

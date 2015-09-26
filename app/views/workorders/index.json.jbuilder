json.array!(@workorders) do |workorder|
  json.extract! workorder, :id
  json.url workorder_url(workorder, format: :json)
end

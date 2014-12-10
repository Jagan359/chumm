json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :age
  json.url customer_url(customer, format: :json)
end

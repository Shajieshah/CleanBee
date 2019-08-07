json.success true
json.message "success"
json.laundries @laundries.each do |laundry|
  json.id laundry.id
  json.name laundry.name

  json.capabilities laundry.capabilities.distinct do |laundry_capability|
    json.id laundry_capability.id
    json.name laundry_capability.name
    json.price 12.0
  end

end
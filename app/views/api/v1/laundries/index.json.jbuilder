json.success true
json.message "success"
json.laundries @laundries.each do |laundry|
  json.id laundry.id
  json.name laundry.name

  json.capabilities laundry.shop_services do |shop_service|
    json.id shop_service.capability_id
    json.name shop_service.capability.name
    json.service_charges shop_service.cost
  end

end
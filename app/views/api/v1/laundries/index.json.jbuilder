json.success true
json.message "success"
json.laundries @laundries.each do |laundry|
  json.id laundry.id
  json.name laundry.name

  json.capabilities laundry.laundry_capabilities do |shop_service|
    json.id Capability.first.id
    json.name Capability.first.name
    json.service_charges Capability.first.cost rescue nil
  end

end


json.data do
  json.laundries @laundries.each do |laundry|
    json.id laundry.id
    json.name laundry.name

    json.capabilities laundry.shop_services do |shop_service|
      json.id Capability.first.id
      json.name Capability.first.name
      json.service_charges Capability.first.cost rescue nil
    end

  end
end
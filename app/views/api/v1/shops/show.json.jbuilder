json.success true
json.message "success"
json.shop do
  json.id @shop.id
  json.name @shop.name
  json.description @shop.description
  json.opening_time @shop.opening_time
  json.closing_time @shop.closing_time
  json.latitude @shop.latitude
  json.longitude @shop.longitude
  json.address @shop.address
  json.online @shop.online
  json.image @shop.image.present? ? @shop.image.url : nil

  json.laundries @shop.laundries.each do |laundry|

    json.id laundry.id
    json.name laundry.name

    json.delivery_cost laundry.delivery_cost.present? ? laundry.delivery_cost : 5
    json.capabilities @shop.capabilities.each do |capability|
      json.capability_id capability.id
      json.capability capability.name
      json.service_charges capability.cost rescue nil
    end
  end
end

json.data do
  json.id @shop.id
  json.name @shop.name
  json.description @shop.description
  json.opening_time @shop.opening_time
  json.closing_time @shop.closing_time
  json.latitude @shop.latitude
  json.longitude @shop.longitude
  json.address @shop.address
  json.online @shop.online
  json.image @shop.image.present? ? @shop.image.url : nil

  json.laundries @shop.laundries.each do |laundry|

    json.id laundry.id
    json.name laundry.name

    json.delivery_cost laundry.delivery_cost.present? ? laundry.delivery_cost : 5
    json.capabilities @shop.capabilities.each do |capability|
      json.capability_id capability.id
      json.capability capability.name
      json.service_charges capability.cost rescue nil
    end
  end
end

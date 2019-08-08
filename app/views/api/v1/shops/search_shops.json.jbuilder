json.success true
json.message "success"

json.shops @shops.each do |record|

  json.id record.shop.id
  json.name record.shop.name
  json.description record.shop.description
  json.rating 4.2
  json.online record.shop.online
  json.image "https://i.stack.imgur.com/BK4TW.png"
  json.favourite false 

  json.laundries record.shop.laundries.distinct.each do |laundry|

    json.id laundry.id
    json.name laundry.name

    json.delivery_cost laundry.delivery_cost.present? ? laundry.delivery_cost : 5

    json.capabilities laundry.capabilities.each do |capability|

      json.capability_id capability.id
      json.capability capability.name
      json.service_charges record.cost

    end

  end

end

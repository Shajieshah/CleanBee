json.message "success"
json.success true

json.orders @orders do |order|
  json.id order.id
  json.order_type order.order_type
  json.pick_location order.pick_location
  json.pickup_time order.pickup_time
  json.pickup_date order.pickup_date
  json.delivery_time order.delivery_time
  json.delivery_date order.delivery_date
  json.status order.status
  json.cost order.cost
  json.pick_lat order.pick_lat
  json.pick_lng order.pick_lng

  json.laundries order.order_laundries do |order_laundry|
    json.id order_laundry.laundry_id
    json.name order_laundry.laundry.name

    json.capabilities order_laundry.laundry.laundry_capabilities do |laundry_capability|
      json.name laundry_capability.capability.name
    end
  end

end


json.data do

  json.orders @orders do |order|
    json.id order.id
    json.order_type order.order_type
    json.pick_location order.pick_location
    json.pickup_time order.pickup_time
    json.pickup_date order.pickup_date
    json.delivery_time order.delivery_time
    json.delivery_date order.delivery_date
    json.status order.status
    json.cost order.cost
    json.cost order.pick_lat
    json.cost order.pick_lng

    json.laundries order.order_laundries do |order_laundry|
      json.id order_laundry.laundry_id
      json.name order_laundry.laundry.name

      json.capabilities order_laundry.laundry.laundry_capabilities do |laundry_capability|
        json.name laundry_capability.capability.name
      end
    end
  end

end
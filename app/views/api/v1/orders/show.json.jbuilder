json.message "success"
json.success true

json.order do

  json.id @order.id
  json.order_type @order.order_type
  json.pick_location @order.pick_location
  json.pickup_time @order.pickup_time
  json.pickup_date @order.pickup_date
  json.delivery_time @order.delivery_time
  json.delivery_date @order.delivery_date
  json.status @order.status
  json.cost @order.cost
  json.shop_lat @order.shop_lat
  json.shop_lng @order.shop_lng

  json.laundries @order.order_laundries do |order_laundry|
    json.id order_laundry.laundry_id
    json.name order_laundry.laundry.name

    json.capabilities order_laundry.laundry.laundry_capabilities.where(order_id: order.id) do |laundry_capability|
      json.name laundry_capability.capability.name
    end
  end


end

json.data do

  json.id @order.id
  json.order_type @order.order_type
  json.pick_location @order.pick_location
  json.pickup_time @order.pickup_time
  json.pickup_date @order.pickup_date
  json.delivery_time @order.delivery_time
  json.delivery_date @order.delivery_date
  json.status @order.status
  json.cost @order.cost
  json.shop_lat @order.shop_lat
  json.shop_lng @order.shop_lng

  json.laundries @order.order_laundries do |order_laundry|
    json.id order_laundry.laundry_id
    json.name order_laundry.laundry.name

    json.capabilities order_laundry.laundry.laundry_capabilities.where(order_id: order.id) do |laundry_capability|
      json.name laundry_capability.capability.name
    end
  end


end
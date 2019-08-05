json.message "success"
json.success true

json.order do
  json.id @order.id
  json.order_type @order.order_type
  json.pick_location @order.pick_location
end
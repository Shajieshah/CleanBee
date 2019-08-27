json.success true
json.message "success"

json.data do
  json.notifications @notifications.each do |notification|
    json.id notification.id
    json.user_id notification.user_id
    json.shop_id notification.shop_id
    json.order_id notification.order_id
    json.title notification.title
    json.message notification.message
    json.created_at notification.created_at
  end
end
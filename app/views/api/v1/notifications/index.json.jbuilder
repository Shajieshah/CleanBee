json.success true
json.message "success"

json.data do
  json.notifications @notifications.each do |notification|
    json.id notification.id
    json.title notification.title
    json.message notification.message
    json.created_at notification.created_at
  end
end
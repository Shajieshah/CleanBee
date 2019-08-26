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
end

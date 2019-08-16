json.success true
json.message "success"
json.shops @shops.each do |join_record|
  json.id join_record.shop.id
  json.name join_record.shop.name
  json.description join_record.shop.description
  json.timings join_record.shop.timings
  json.latitude join_record.shop.latitude
  json.longitude join_record.shop.longitude
  json.address join_record.shop.address
  json.online join_record.shop.online
  json.image join_record.shop.image.present? ? join_record.shop.image.url : nil
end

json.data do
  json.shops @shops.each do |join_record|
    json.id join_record.shop.id
    json.name join_record.shop.name
    json.description join_record.shop.description
    json.timings join_record.shop.timings
    json.latitude join_record.shop.latitude
    json.longitude join_record.shop.longitude
    json.address join_record.shop.address
    json.online join_record.shop.online
    json.image join_record.shop.image.present? ? join_record.shop.image.url : nil
  end
end
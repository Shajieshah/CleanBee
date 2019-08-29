json.success true
json.message "success"

json.shops @shops.each do |join_record|

  json.id join_record.shop.id
  json.name join_record.shop.name
  json.description join_record.shop.description
  json.rating 4
  json.online join_record.shop.online
  json.image join_record.shop.image.present? ? join_record.shop.image.url : nil
  json.favourite true

end

json.data do
  json.shops @shops.each do |join_record|
    json.id join_record.shop.id
    json.name join_record.shop.name
    json.description join_record.shop.description
    json.rating 4
    json.online join_record.shop.online
    json.image join_record.shop.image.present? ? join_record.shop.image.url : nil
    json.favourite true
  end
end
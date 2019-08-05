if !@shop.nil?
	json.success true
	json.message "success"
	json.shop do
		json.id @shop.id
		json.name @shop.name
		json.description @shop.description
		json.timings @shop.timings
		json.latitude @shop.latitude
		json.longitude @shop.longitude
		json.address @shop.address
		json.online @shop.online
		json.image @shop.image.present? ? @shop.image.url : nil
	end
else
	json.success false
	json.message "shop not found"
end
unless @laundries.blank?

	json.success true
	json.message "success"
	json.laundries @laundries.each do |laundry|
		json.id laundry.id
		json.name laundry.name
	end

else
	json.success true
	json.message "no laundry found"
end
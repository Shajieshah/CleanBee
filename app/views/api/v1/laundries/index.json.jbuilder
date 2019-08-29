json.success true
json.message "success"
json.laundries @laundries.each do |laundry|
  json.id laundry.id
  json.name laundry.name

  json.capabilities laundry.capabilities do |capability|
    json.id capability.id
    json.name capability.name
    json.service_charges capability.cost rescue nil
  end

end


json.data do
  json.laundries @laundries.each do |laundry|
    json.id laundry.id
    json.name laundry.name

    json.capabilities laundry.capabilities do |capability|
      json.id capability.id
      json.name capability.name
      json.service_charges capability.cost rescue nil
    end
  end
end
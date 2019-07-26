json.message "success"
json.success true

json.user do

  json.id @resource.id
  json.role @resource.role
  json.phone @resource.phone
  json.email @resource.email
  json.user_name @resource.user_name
  json.address @resource.address
  json.latitude @resource.latitude
  json.longitude @resource.longitude
  json.ride @resource.ride unless @resource.ride.nil?
  json.phone_verified @resource.phone_verified
  # json.confirmed_at @resource.confirmed_at
  json.profile_image @resource.image.present? ? @resource.image.url : nil

end
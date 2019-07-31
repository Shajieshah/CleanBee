json.message "success"
json.success true

json.user do

  json.id @profile.id
  json.role @profile.role
  json.phone @profile.phone
  json.email @profile.email
  json.user_name @profile.user_name
  json.address @profile.address
  json.latitude @profile.latitude
  json.longitude @profile.longitude
  json.ride @profile.ride unless @profile.ride.nil?
  json.phone_verified @profile.phone_verified
  # json.confirmed_at @profile.confirmed_at
  json.profile_image @profile.image.present? ? @profile.image.url : nil

end
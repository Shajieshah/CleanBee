json.message "success"
json.success true

json.user do

  json.id @resource.id
  json.role @resource.role
  json.phone @resource.phone
  json.email @resource.email
  json.user_name @resource.user_name
  json.phone_verified @resource.phone_verified

  # json.profile do
  #   json.id @profile.id
  #   json.name @profile.name
  #   json.country @profile.country
  #   json.about @profile.about
  #   json.account_type @profile.account_type
  #   json.reputation @profile.reputation
  #   json.fcm @profile.fcm
  #   json.created_at @profile.created_at
  #   json.profile_image @profile.profile_image.attached? ? @profile.profile_image.first.service_url : nil
  #   json.background_image @profile.background_image.attached? ? @profile.background_image.first.service_url : nil
  # end

end
ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :owner, :assignee_id, :shop, :order_type, :pick_location, :pickup_time, :pickup_date,
                :delivery_date, :delivery_time, :status, :cost, :pick_lat, :pick_lng, :shop_lat, :shop_lng
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #

  form do |f|
    f.inputs do
      f.input :owner, :as => :select, :collection => User.all.where(role: "customer").map {|u| [u.user_name, u.id]},required: true
      f.input :assignee, :as => :select, :collection => User.all.where(role: "rider").map {|u| [u.user_name, u.id]}
      f.input :shop
      f.input :order_type
      f.input :pick_location
      f.input :pickup_time
      f.input :pickup_date
      f.input :delivery_time
      f.input :delivery_date
      f.input :status
      f.input :cost
      f.input :pick_lat
      f.input :pick_lng
      f.input :shop_lat
      f.input :shop_lng

    end
    f.actions
  end
  
end

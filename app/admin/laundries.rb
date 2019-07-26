ActiveAdmin.register Laundry do

  permit_params :name

  action_item :Laundry, only: :show do
    link_to 'Return to List', "/admin/laundries"
  end

  action_item :Laundry, only: :edit do
    link_to 'Return to List', "/admin/laundries"
  end

  action_item :Laundry, only: :new do
    link_to 'Return to List', "/admin/laundries"
  end

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
    end
  end


  form do |f|
    f.inputs "Laundry" do
      f.input :name
    end
    f.actions
  end

end

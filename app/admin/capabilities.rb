ActiveAdmin.register Capability do

  permit_params :name

  action_item :Capability, only: :show do
    link_to 'Return to List', "/admin/capabilities"
  end

  action_item :Capability, only: :edit do
    link_to 'Return to List', "/admin/capabilities"
  end

  action_item :Capability, only: :new do
    link_to 'Return to List', "/admin/capabilities"
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
    f.inputs "Capability" do
      f.input :name
    end
    f.actions
  end

end

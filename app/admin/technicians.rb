ActiveAdmin.register Technician do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, role_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form title: 'New Technician Form', html: { multipart: true } do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Technician Details' do
      input :name
      input :roles, as: :check_boxes
      f.actions
    end
  end

end

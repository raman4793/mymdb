ActiveAdmin.register Movie do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
  permit_params :title, :poster_path, :overview,:backdrop_path, :budget, :homepage, :language, :release_date, :revenue, :runtime, :status, :tagline, :trailer, movie_technicians_attributes: [:id, :role_id, :technician_id, :_destroy], tag_ids: [], company_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#

  form title: 'New Movie Form', html: { multipart: true } do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Movie Details' do
      input :title
      input :poster_path, as: :file

      input :tags, as: :check_boxes

      input :companies, as: :select

      # f.inputs do
      #   f.has_many :movies_tags, heading: 'Genres',
      #              allow_destroy: true,
      #              new_record: false do |a|
      #     a.input :tag_id
      #   end
      # end

      f.inputs do
        f.has_many :movie_technicians, heading: 'Technicians', allow_destroy: true do |a|
          a.input :technician
          a.input :role
        end
      end

      input :backdrop_path, as: :file

      input :budget
      input :homepage
      input :language, as: :select, collection: ['English', 'French', 'German', 'Japanese', 'Chinese', 'Korean',
              'Malayalam', 'Hindi', 'Tamil']
      input :overview

      f.input :release_date, as: :datepicker,
              datepicker_options: {
                  min_date: "1900-10-8",
                  max_date: "+3D"
              }

      input :revenue
      input :runtime
      input :status
      input :tagline
      input :trailer


      f.actions
    end
  end

end

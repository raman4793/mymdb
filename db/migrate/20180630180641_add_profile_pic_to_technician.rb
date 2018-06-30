class AddProfilePicToTechnician < ActiveRecord::Migration[5.0]
  def change
    add_column :technicians, :profile_pic, :string
    add_column :technicians, :background_pic, :string
  end
end

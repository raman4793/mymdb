class AddDescriptionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :text
    add_column :users, :profile_pic, :string
    add_column :users, :background_pic, :string
  end
end

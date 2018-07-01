class CreateTagsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_users do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end

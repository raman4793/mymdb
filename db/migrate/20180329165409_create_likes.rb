class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true
      t.references :liker, polymorphic: true

      t.timestamps
    end
  end
end

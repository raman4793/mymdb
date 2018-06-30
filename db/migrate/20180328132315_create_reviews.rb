class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer_type
      t.integer :reviewer_id
      t.references :movie, foreign_key: true
      t.text :content
      t.string :type

      t.timestamps
    end
  end
end

class CreateMovieTechnicians < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_technicians do |t|
      t.references :technician, foreign_key: true
      t.references :role, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMoviesCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies_companies do |t|
      t.references :movie, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end

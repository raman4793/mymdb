class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string  :title
      t.string  :poster_path
      t.string  :backdrop_path
      t.float   :budget
      t.string  :homepage
      t.string  :language
      t.string  :overview
      t.date    :release_date
      t.float   :revenue
      t.integer :runtime
      t.string  :status
      t.string  :tagline
      t.string  :trailer

      t.timestamps
    end
  end
end

class MovieTechnician < ApplicationRecord
  belongs_to :technician
  belongs_to :role
  belongs_to :movie
end

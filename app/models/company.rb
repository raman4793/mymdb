class Company < ApplicationRecord

  has_many :movies_companies, dependent: :destroy
end

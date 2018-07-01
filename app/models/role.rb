class Role < ApplicationRecord

  has_many :technician_role, dependent: :destroy

end

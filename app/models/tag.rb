class Tag < ApplicationRecord
  has_many :movies, through: :movies_tags
  has_many :movies_tags

  has_and_belongs_to_many :users, dependent: :destroy

  def name
    value
  end
end

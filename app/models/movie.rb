class Movie < ApplicationRecord

  has_many :tags, through: :movies_tags
  has_many :movies_tags

  has_many :reviews

  has_many :companies, through: :movies_companies
  has_many :movies_companies

  has_many :technicians, through: :movie_technicians
  has_many :movie_technicians

  has_many :comments, as: :commentable
  has_many :likes, as:  :likeable

  accepts_nested_attributes_for :movies_tags
  accepts_nested_attributes_for :movie_technicians

  ratyrate_rateable 'quality'

  def ratings
    dimension = 'quality'
    self.rates(dimension)
  end

  def rating
    dimension = 'quality'
    avg = self.average(dimension)
    if avg
      (avg.avg / 5)*100
    else
      0
    end
  end
end

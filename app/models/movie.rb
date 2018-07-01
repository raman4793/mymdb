class Movie < ApplicationRecord

  has_many :tags, through: :movies_tags, dependent: :destroy
  has_many :movies_tags, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :companies, through: :movies_companies, dependent: :destroy
  has_many :movies_companies, dependent: :destroy

  has_many :technicians, through: :movie_technicians, dependent: :destroy
  has_many :movie_technicians, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as:  :likeable, dependent: :destroy

  accepts_nested_attributes_for :movies_tags
  accepts_nested_attributes_for :movie_technicians

  ratyrate_rateable 'quality'
  ratyrate_rateable 'direction'
  ratyrate_rateable 'story'
  ratyrate_rateable 'script'
  ratyrate_rateable 'camera'


  def ratings
    dimension = 'quality'
    self.rates(dimension)
  end

  def rating
    dimension = 'quality'
    avg = self.average(dimension)
    if avg
      (avg.avg / 10)*100
    else
      0
    end
  end

  def by(user)
    self.likes.find_by(liker: user)
  end
end

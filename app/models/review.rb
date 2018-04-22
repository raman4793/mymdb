class Review < ApplicationRecord
  belongs_to :movie

  belongs_to :reviewer, polymorphic: true

  has_many :comments, as: :commentable
  has_many :likes, as:  :likeable

  def by(user)
    self.likes.find_by(liker: user)
  end

end

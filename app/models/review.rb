class Review < ApplicationRecord
  belongs_to :movie

  belongs_to :reviewer, polymorphic: true

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as:  :likeable, dependent: :destroy

  def by(user)
    self.likes.find_by(liker: user)
  end

end

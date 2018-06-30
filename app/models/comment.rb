class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, polymorphic: true

  has_many :comments, as: :commentable
  has_many :likes, as:  :likeable

  def by(user)
    self.likes.find_by(liker: user)
  end

end

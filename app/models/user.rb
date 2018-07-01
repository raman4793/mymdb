class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_pic, AvatarUploader
  mount_uploader :background_pic, BackgroundUploader

  has_many :reviews, as: :reviewer, dependent: :destroy

  has_many :comments, as: :commenter, dependent: :destroy

  has_many :likes, as: :liker, dependent: :destroy

  has_and_belongs_to_many :tags, dependent: :destroy

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy
  has_many :messages, as: :sendable, dependent: :destroy

  ratyrate_rater
  acts_as_followable
  acts_as_follower

  def blocked?(user)
      self.blocks.include?(user)
  end

  def likes?(likeable)
    !likes.where(likeable: likeable).empty?
  end

  def send_message(to, msg)
    conversation = Conversation.where({sendable: self, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: self}).first
    end
    if conversation.nil?
      conversation = Conversation.create({sendable: self, recipientable: to})
    end
    conversation.messages.create(content: msg, sendable: self)
  end

  def get_messages(from)
    conversation = Conversation.where({sendable: self, recipientable: from}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: from, recipientable: self}).first
    end
    if conversation.nil?
      nil
    else
      conversation.messages
    end
  end

  def self.get_conversation(from, to)
    conversation = Conversation.where({sendable: from, recipientable: to}).first
    if conversation.nil?
      conversation = Conversation.where({sendable: to, recipientable: from}).first
    end
  end

  def get_conversations
    puts("Loading conversations of current_user")
    Conversation.where({recipientable: self}).or(Conversation.where({sendable: self}))
    # Conversation.where("recipientable_type LIKE 'User' AND recipientable_id=#{self.id} OR sendable_type LIKE 'User' AND sendable_id=#{self.id}")
  end

  def get_liked_movies
    likes.where(likeable_type: 'Movie')
  end

  def get_liked_movie_list
    ids = get_liked_movies.pluck(:likeable_id)
    Movie.find(ids)
  end

  def get_recommendations
    liked_movies = get_liked_movies
    ids = liked_movies.pluck(:id)
    movies = nil
    if ids.empty?
      movies = Movie.all
    else
      movies = Movie.all.where('id NOT IN (?)', ids)
    end
    recommendations = []
    movies.each do |movie|
      intersection = movie.tags & self.tags
      puts("Movie Tags")
      pp(movie.tags)
      puts("My Tags")
      pp(self.tags)
      puts "Intersection : #{intersection}"
      if intersection.length >= 1
        recommendations << movie
      end
    end
    recommendations
  end
end

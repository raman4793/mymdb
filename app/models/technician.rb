class Technician < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :profile_pic, AvatarUploader
  mount_uploader :background_pic, BackgroundUploader

  has_many :reviews, as: :reviewer, dependent: :destroy

  has_many :roles, through: :technician_roles, dependent: :destroy

  has_many :technician_roles, dependent: :destroy

  has_many :movie_technicians, dependent: :destroy

  has_many :comments, as: :commenter, dependent: :destroy

  has_many :likes, as: :liker, dependent: :destroy

  has_many :conversations, as: :sendable, dependent: :destroy
  has_many :conversations, as: :recipientable, dependent: :destroy
  has_many :messages, as: :sendable, dependent: :destroy

  ratyrate_rater


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
    sent = Conversation.where({sendable: self})
    recieved = Conversation.where({recipientable: self})
    conversations = sent.or(recieved)
  end

end

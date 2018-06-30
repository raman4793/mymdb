class Conversation < ApplicationRecord
  belongs_to :sendable, polymorphic: true
  belongs_to :recipientable, polymorphic: true

  has_many :messages, dependent: :destroy

  def other(user)
    if sendable == user
      recipientable
    else
      sendable
    end
  end


end

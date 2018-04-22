class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sendable, polymorphic: true
end

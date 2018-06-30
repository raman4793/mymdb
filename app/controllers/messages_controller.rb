class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save

    end
  end

  def message_params
    params.require(:message).permit(:content, :sendable_id, :sendable_type, :conversation_id)
  end
end

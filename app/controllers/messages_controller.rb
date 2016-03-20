class MessagesController < ApplicationController
  before_action :require_login
  
  def index
    @unread_messages = current_user.unread_messages
  end

  def new_message
    @friends = current_user.friends
    @recipient = User.find_or_initialize_by(id: params[:recipient_id])

    @sent_messages = current_user.unread_messages_to_user(@recipient.id)
    @received_messages = current_user.unread_messages_from_user(@recipient.id)

    @messages = @sent_messages + @received_messages
    @messages = @messages.sort_by(&:created_at)

    # Make received messages as read
    @received_messages.each do |message|
      message.seen_at = Time.current
      message.save
    end
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id

    if @message.save
      redirect_to new_message_path(recipient_id: @message.recipient_id)
    else
      flash.now[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      render 'new_message', layout: false
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :recipient_id)
  end
end

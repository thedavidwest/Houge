class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
		@messages = Message.all
    @message = Message.new
	end
  def new
    @message = current_user.messages.build
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to '/messages'
    else
      render 'new'
  end
end
  private
  def set_message
    @message = Message.find(params[:id])
  end

  def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to messages_path, notice: "Unable to locate page." if @message.nil?
  end
  def message_params
    params.require(:message).permit(:content)
  end
end

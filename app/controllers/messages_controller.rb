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
  def show
  end
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to '/messages'
    else
      render 'new'
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to '/messages', notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @messages }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully deleted.' }
      format.json { head :no_content }
    end
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
    params.require(:message).permit(:content, :username)
  end
end

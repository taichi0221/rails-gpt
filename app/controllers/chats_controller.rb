class ChatsController < ApplicationController
  def index
    @messages = Chat.all.order(created_at: :desc)
    @response = params[:response]
  end
  
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path
    else
      @chats = Chat.all
      render 'index'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end
end

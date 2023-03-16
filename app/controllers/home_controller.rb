class HomeController < ApplicationController
  def index
  end

  def chat
    input_text = params[:input_text]
    response = GPT.chat(input_text)
    render json: { response: response }
  end
end

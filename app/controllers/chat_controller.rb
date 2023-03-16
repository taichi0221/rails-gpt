class ChatController < ApplicationController
end
require 'openai'

class ChatController < ApplicationController
  def index
    prompt = "Hello, how are you?"
    response = OpenAI::Completion.create(
      engine: "text-davinci-002",
      prompt: prompt,
      max_tokens: 50
    ).choices[0].text.strip

    @chatlog = [
      { speaker: "bot", text: response },
      { speaker: "user", text: prompt }
    ]
  end

  def create
    prompt = params[:prompt]
    response = OpenAI::Completion.create(
      engine: "text-davinci-002",
      prompt: prompt,
      max_tokens: 50
    ).choices[0].text.strip

    render json: { response: response }
  end
end

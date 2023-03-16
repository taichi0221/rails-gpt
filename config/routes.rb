Rails.application.routes.draw do
  root to: 'home#index'
  post 'home/chat', to: 'home#chat'
end

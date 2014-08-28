Rails.application.routes.draw do
  root to: 'static#root'

  resources :users do
    resources :boards , shallow: true do
      resources :cards
    end
    
    resources :cards, shallow: true
  end

  resources :boards, only: :index

  resource :session, only: [:new, :create, :destroy]

  resources :board_likes, only: [:create, :destroy]
  resources :card_likes, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :boards
    resources :cards
  end
end

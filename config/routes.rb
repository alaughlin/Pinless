Rails.application.routes.draw do
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
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'
end

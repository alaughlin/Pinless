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
    resources :users do
      resources :boards, shallow: true
      resources :cards, shallow: true                   
    end

    resources :cards, only: [:create, :destroy]
    resources :friendships, only: :create

    delete '/friendships', to: 'friendships#destroy'
    get '/boards/:id/cards', to: 'cards#board_cards'
    get '/users/:id/boards/liked', to: 'boards#liked_boards'
    get '/users/:id/cards/liked', to: 'cards#liked_cards'
    get '/users/:id/friends', to: 'users#friends'
    get '/users/:id/friendrequests', to: 'users#friend_requests'
    get '/checkforrequest/:id', to: 'users#check_for_request'
    get '/currentuser', to: 'users#get_current_user'
    get '/search', to: 'search#search'
  end
end

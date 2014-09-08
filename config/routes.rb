Rails.application.routes.draw do
  root to: 'static#root'

  mount_griddler

  # resources :users do
  #   resources :boards , shallow: true do
  #     resources :cards
  #   end
    
  #   resources :cards, shallow: true
  # end

  # resources :boards, only: :index

  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  # resources :board_likes, only: [:create, :destroy]
  # resources :card_likes, only: [:create, :destroy]
  # resources :friendships, only: [:create, :destroy]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :boards, shallow: true
      resources :cards, shallow: true                   
    end

    resources :boards, only: [:create, :destroy]
    resources :cards, only: [:create, :destroy]
    resources :friendships, only: [:create, :destroy]

    delete '/friendships/requests', to: 'friendships#destroy_request'
    get '/boards/:id/cards', to: 'cards#board_cards'
    get '/users/:id/boards/liked', to: 'boards#liked_boards'
    get '/users/:id/cards/liked', to: 'cards#liked_cards'
    get '/users/:id/friends', to: 'users#friends'
    get '/users/:id/friendrequests', to: 'users#friend_requests'
    get '/checkforrequest/:id', to: 'users#check_for_request'
    get '/currentuser', to: 'users#get_current_user'
    get '/search', to: 'search#search'
    post '/board_likes', to: 'board_likes#board_like'
    post '/card_likes', to: 'card_likes#card_like'
    get '/feed', to: 'feeds#index'
  end
end

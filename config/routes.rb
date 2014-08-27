Rails.application.routes.draw do
  resources :users do
    resources :boards , shallow: true do
      resources :cards
    end
    
    resources :cards, shallow: true
  end

  resources :boards, only: :index

  resource :session, only: [:new, :create, :destroy]

  resource :board_likes, only: [:create, :destroy]
  resource :card_likes, only: [:create, :destroy]
  resource :friend_requests, only: [:create, :destroy]
end

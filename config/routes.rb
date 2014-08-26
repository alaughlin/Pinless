Rails.application.routes.draw do
  resources :users do
    resources :cards
  end
  resource :session, only: [:new, :create, :destroy]
end

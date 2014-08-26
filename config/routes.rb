Rails.application.routes.draw do
  resources :users do
    resources :boards , shallow: true do
      resources :cards, shallow: true
    end
  end
  resource :session, only: [:new, :create, :destroy]
end

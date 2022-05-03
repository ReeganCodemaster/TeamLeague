Rails.application.routes.draw do
  root 'teams#index'

  resources :teams do 
    resources :players do
      get :delete, on: :member
    end
  end

  resources :games

  resources :tournaments
end

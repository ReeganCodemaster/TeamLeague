Rails.application.routes.draw do
  root "teams#index"
  resources :teams do 
    get :tournament on: :member
    resources :players do
      get :delete, on: :member
    end
    resources :games
  end
end

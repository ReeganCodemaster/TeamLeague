Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "teams#index"
  resources :teams do 
    resources :players do
      get :delete, on: :member
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

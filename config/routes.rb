Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'
  
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'home', to: 'videos#index'
  get 'genre', to: 'categories#show'

  resources :videos do
    collection do
      get 'search'
    end
  end

  resources :categories
  resources :users
end

Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'
  
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'home', to: 'videos#index'

  resources :videos do

    resources :reviews, only: [:create]

    collection do
      get 'search'
    end
  end

  resources :categories, path: "genre"
  resources :users

  get 'my_queue', to: 'queue_items#index'
  post 'my_queue', to: 'queue_items#create'
  resources :queue_items, only: [:destroy]

end

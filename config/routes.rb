Rails.application.routes.draw do
  resources :pages, except: [:show]

  resources :movies, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  get '/pages/:permalink' => "pages#permalink", as: 'permalink'
  #get 'home/index'
  # get 'production_companies/index'
  # get 'production_companies/show'
  # get 'movies/index'
  # get 'movies/show'


  root to: "home#index"
  resources :movies, only: [:index, :show] do
    collection do
      get "search"
    end
    # movies/search/(:format) is now available in our route paths (rails/info/routes)
  end
  resources :production_companies, only: [:index, :show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

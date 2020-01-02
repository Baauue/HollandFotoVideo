Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  
  root 'users#index'

  resources :users do
    collection do
    	get 'showpage'
    end
  end

  resources :images do
    collection do
      get 'addimage'
      post 'pictures'
    end
  end

end

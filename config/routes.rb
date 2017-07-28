Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users, only: :show do
    resources :registered_applications, shallow: true, except: [:index, :new] do 
      resources :events, shallow: true, except: [:index, :new]
    end
  end
  
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  
  root 'welcome#index'
  
end
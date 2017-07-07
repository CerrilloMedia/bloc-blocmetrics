Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users, only: :show do
    resources :registered_applications, shallow: true, except: [:index, :new] do 
      resources :events, shallow: true, except: [:index, :new]
    end
  end
  
  root 'welcome#index'
  
end
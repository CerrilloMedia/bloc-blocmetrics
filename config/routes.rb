Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users, only: :show do
    resources :registered_applications, shallow: true, except: [:index, :new]
  end
  
  root 'welcome#index'
  
end
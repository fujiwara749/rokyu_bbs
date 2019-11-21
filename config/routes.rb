Rails.application.routes.draw do
  root to: 'boards#index'
  get 'search', to: 'boards#search'
  
  devise_for :admins
  namespace :admin do
    get 'top', to: 'top#top'
    scope :boards do
      get 'search', to: 'boards#search'
    end
  	resources :categories, only: [:index, :show, :new, :create, :destroy]
  	resources :users, only: [:index, :show, :edit, :update, :destroy] 
    resources :boards, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:destroy] 
    end
  end

  devise_for :users
  resources :users, only: [:show, :destroy] 
  resources :categories, only: [:index, :show]
  resources :boards do
    resource :comments, only:[:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

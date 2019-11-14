Rails.application.routes.draw do
  
  devise_for :admins
  namespace :admin do
  	get 'top', to: 'top#top'
  	resources :boards, only: [:index, :show, :new, :create, :destroy]
  	resources :categories, only: [:index, :new, :create, :destroy]
  	resources :users, only: [:index, :show, :edit, :update, :destroy] 
  end

  devise_for :users
  get 'home/index'
  get 'home/show'

  get 'boards/index'
  post 'boards/create' => 'topics#create'

  resources :boards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

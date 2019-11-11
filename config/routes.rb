Rails.application.routes.draw do
  
  namespace :admin do
  	get 'top', to: 'top#top'
  	resources :users, only: [:index, :show, :edit, :update, :destroy] do
    end
  end
  devise_for :users
  get 'home/index'
  get 'home/show'

  get 'boards/index'


  resources :boards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

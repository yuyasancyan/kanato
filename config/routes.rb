Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  patch 'flowers/:id' => 'flowers#update'
  get 'flowers/:id/edit' => 'flowers#edit', as:'edit_flower'
  delete 'flowers/:id' => 'flowers#destroy'
  

  resources :flowers do
    resources :likes, only: [:create, :destroy] 
    resources :comments, only: [:create]   
   
  end

  resources :perfumes
  
  get 'flowers/:flower_id/likes' => 'likes#create'
  get 'flowers/:flower_id/likes/:id' => 'likes#destroy'

  root 'flowers#top'

  
end


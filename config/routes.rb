Rails.application.routes.draw do
    namespace :user do
      get 'homes/top'
      get 'homes/about'
    end
    namespace :admin do
      get 'homes/top'
    end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
    namespace :admin do
      root to: 'homes#top'
      resources :users, only: [:index, :show, :edit, :update]
      resources :genres, only: [:new, :index, :create, :edit, :update]
      resources :items, only: [:new, :index, :create, :show, :edit, :update] do
        resources :item_comments, only: [:index, :destroy]
      end  
      resources :reviews, only: [:index, :show, :edit, :update, :destroy]
      resources :comments, only: [:index, :edit, :destroy, :update, :show]
    end
    
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
    scope module: :user do
      root to: 'homes#top'
      get 'home/about' => 'home#about', as: 'about'
      resources :items, only: [:index, :show] do
        resources :item_comments, only: [:create, :index, :destroy]
      end  
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
      resources :managements, only: [:new, :index, :edit, :create, :update, :show]
      resources :reviews, only: [:new, :index, :edit, :create, :update, :show, :destroy]
      get 'users/show' => 'users#show', as: 'show' 
      get 'users/edit' => 'users#edit', as: 'edit'
      get 'users/confirm' => 'users#confirm', as: 'confirm'
      patch 'users/update' => 'users#update', as: 'update'
      patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    
      delete 'simulations/destroy_all' => 'simulations#destroy_all', as: 'destroy_all'
      resources :simulations, only: [:index, :update, :destroy, :create]
    end  
  
  
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  root to: "visions#new"
  get 'visions/new'


  resources :values
  resources :visions
  resources :resources
  resources :jobs
  resources :sectors
  resources :shares
  resources :asks
  resources :influencers
  
  
 

  get '/sharesasks', to: 'sharesasks#index', as: :sharesasks
  get '/profile', to: 'users#profile', as: :profile
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/profilequiz', to: 'profilequiz#home', as: :profilequiz
  get '/myprofile', to: 'profilequiz#myprofile', as: :myprofile


  devise_for :users ,:controllers => { :omniauth_callbacks => "callbacks" },
    format: false

  devise_scope :user do
   
    get 'user/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session  
    get 'users/auth/facebook' , :to =>"users_callback#passthru", :as => :facebook_login

    end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users do
  # end
end

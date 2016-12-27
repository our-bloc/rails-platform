Rails.application.routes.draw do
  resources :values
  resources :visions
  resources :resources
  root to: "profilequiz#home"
  get 'welcome/home'

  resources :jobs do
   member do
    put "like", to: "jobs#upvote"
    put "dislike", to: "jobs#downvote"
  end
  resources :sectors
  resources :shares
  resources :asks
  resources :influencers
  
  
 
end

  get '/sharesasks', to: 'sharesasks#index', as: :sharesasks
  get '/profile', to: 'users#profile', as: :profile
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/profilequiz', to: 'profilequiz#home', as: :profilequiz
  get '/myprofile', to: 'profilequiz#myprofile', as: :myprofile

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users do
  # end
end

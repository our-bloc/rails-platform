Rails.application.routes.draw do
  root to: "welcome#home"
  get 'welcome/home'

  resources :jobs
  resources :sectors
  resources :shares
  resources :asks
  resources :influencers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

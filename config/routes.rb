Rails.application.routes.draw do
  
  root to: "welcome#home"

  
  resources :events
  resources :feedbacks
  
  resources :tips do
    member do
      put "like", to: "tips#like"
      put "unlike", to: "tips#unlike"
      put "dislike", to: "tips#dislike"
    end
  end
  
  resources :profile
  


  resources :values
  resources :visions 
    
    
  resources :resources
  resources :jobs
  resources :sectors
  resources :shares
  resources :asks
  resources :influencers
  
  
 

  get '/sharesasks', to: 'sharesasks#index', as: :sharesasks
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get 'profiles' => 'profile#index', as: :profiles
  get '/home', to: 'welcome#landing', as: :landing
  get '/hello', to: 'welcome#hello', as: :hello
  get '/morehouse', to: 'university#morehouse', as: :morehouse
  get '/conference', to: 'welcome#conference', as: :conference


  get '/myprofile', to: 'profile#myprofile', as: :myprofile
  get '/myplaylist', to: 'profile#playlist', as: :playlist

  get '/referrals', to: 'profile#referrals', as: :referrals

  get 'visions/indeed_show', to: 'visions#indeed_show', as: :indeed_show, format: false

  get ':profileurl' => 'profile#playlist'


  devise_for :users ,:controllers => { :omniauth_callbacks => "callbacks" },
    format: false

  devise_scope :user do
   
    get 'user/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session  
    get 'users/auth/facebook' , :to =>"users_callback#passthru", :as => :facebook_login
    get 'users/email_registration' , :to =>"devise/registrations#email", :as => :email_registration



    end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users do
  # end
end

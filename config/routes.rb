Rails.application.routes.draw do
  
  root to: "welcome#home"

  
  resources :events do
    member do
      put "like", to: "tips#like"
      put "unlike", to: "tips#unlike"
      put "dislike", to: "tips#dislike"
    end
  end
      
  resources :rsvps
  
  resources :feedbacks
  
  resources :tips 
  
  resources :votes, only: [] do
    get 'up', on: :collection
    get 'down', on: :collection
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
  
  resources :resume do 
    get 'export', to: "resume#export"
  end 
  
  resources :experience
  resources :partners



 

  get '/sharesasks', to: 'sharesasks#index', as: :sharesasks
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get 'profiles' => 'profile#index', as: :profiles
  get '/home', to: 'welcome#landing', as: :landing
  get '/hello', to: 'welcome#hello', as: :hello
  get '/morehouse', to: 'welcome#hello', as: :morehouse
  get '/conference', to: 'welcome#conference', as: :conference
  get '/admin', to: 'profile#admin', as: :admin_profile
  get '/register', to: 'rsvps#register', as: :register
  get '/search', to: 'search_engine#search', as: :search 
  get '/testdashboard', to: 'search_engine#dashboard', as: :testdashboard 

  get '/resumebuilder', to: 'resume#build', as: :resumebuilder 
  
  get 'partners/send_email', to: "partners#send_email", as: :send_partner_email
  post 'partners/hook'

  get '/myprofile', to: 'profile#myprofile', as: :myprofile
  get '/myplaylist', to: 'profile#playlist', as: :playlist

  get '/referrals', to: 'profile#referrals', as: :referrals

  get 'visions/indeed_show', to: 'visions#indeed_show', as: :indeed_show, format: false
  get ':companyurl' => 'partners#dashboard'
  get ':profileurl' => 'profile#playlist'


  devise_for :users ,:controllers => { :omniauth_callbacks => "callbacks" },
    format: false

  devise_scope :user do
   
    get 'user/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session  
    get 'users/auth/facebook' , :to =>"users_callback#passthru", :as => :facebook_login
    get 'users/email_registration' , :to =>"devise/registrations#email", :as => :email_registration



    end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
  end
end

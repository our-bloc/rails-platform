class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  #associations
  has_many :jobs
  has_many :asks
  has_many :shares
  has_many :resources
  has_many :influencers
  has_many :visions
  has_many :value
  
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.name= auth.name
        user.uid = auth.uid
        user.email = Devise.friendly_token[0,5]+"@ourbloc.co"
        user.password = Devise.friendly_token[0,20]
        
      end
  end
end
  


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  recommends :tips, :jobs

  #associations
  has_many :jobs
  has_many :asks
  has_many :shares
  has_many :resources
  has_many :influencers
  
  has_many :visions

  
  has_many :value
  has_many :feedbacks
  has_many :events
  
  has_one :profile
  
  #REFERRALS
  belongs_to :referred_by, :class_name => "User", :foreign_key => "referred_by_user_id"
  has_many :referrals, :class_name => "User", :foreign_key => "referred_by_user_id"
  
  
  
  #BUILD USER PROFILE AFTER SIGN UP
  after_create :build_profile

  def build_profile
    Profile.create(user: self) 
  end
  
  
  #CREATE USER THROUGH OMNIAUTH
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.name= auth.info.name
        user.uid = auth.uid
        user.email = Devise.friendly_token[0,10]+"@facebook.com"
        user.password = Devise.friendly_token[0,20]
        user.profileurl = auth.info.name.gsub(/\s+/, "")+rand(10..50).to_s
        user.referral_code = params[:referred_by]
        
      end
  end
end
  


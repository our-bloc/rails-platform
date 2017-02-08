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
        user.firstname= auth.extra.raw_info.first_name
        user.uid = auth.uid
        user.email = auth.info.email || Devise.friendly_token[0,20]+"@facebook.com"
        user.role = "student"
        user.password = Devise.friendly_token[0,20]
        
        #creates users unique profile link
        user.profileurl = auth.info.name.gsub(/\s+/, "").delete('.') + rand(10..50).to_s
        
        
        #more details, user public profile
        user.gender = auth.extra.raw_info.gender
        user.timezone = auth.extra.raw_info.timezone
        user.picture = auth.extra.raw_info.picture.data.url

       

      end
  end
end
  


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]


  #associations
    has_many :jobs
    has_many :visits
    has_many :asks
    has_many :shares
    has_many :resources
    has_many :influencers
    has_many :tips 
    has_many :visions
    belongs_to :parnters
    #EVENT RSVPS
    has_many :rsvps
    has_many :events, through: :rsvps
  
    
    has_many :value
    has_many :feedbacks
    has_many :events
    
    #created on user create
    has_one :profile
    has_many :resumes

  #RECOMMENDATION ENGINE

  #REFERRALS
  
  
  
  
  #BUILD USER PROFILE AFTER SIGN UP
    after_create :build_profile
  
    def build_profile
      Profile.create(user: self) 
    end
    
  #Build user's first template after sign up 
    after_create :build_resume 
      
    def build_resume 
        Resume.create(user: self)
    end 
    
    
    
  #create user without password
    def password_required?
      new_record? ? false : super
    end

     after_create :add_password_and_firstname
  
    def add_password_and_firstname
        password = self.name.gsub(/\s+/, "").delete('.') + rand(10..50).to_s
        profileurl = password
        self.update_attribute(:password, password )
        self.update_attribute(:profileurl, profileurl )
        
        firstname = self.name.split.first
        self.update_attribute(:firstname, firstname)
        
        #send welcome email
        if self.role == "Student"
          WelcomeMailer.welcome_email(self).deliver
        end 
        
        
        #update admin
        NewUserMailer.new_user(self).deliver
    end 
  

  
  
  
  
  #LOGIN WITH TOKEN FROM EMAIL
    def set_login_bypass_token
        raw, enc = Devise.token_generator.generate(User, :login_bypass_token)
        self.login_bypass_token = enc
        self.save(validate: false)
        raw
     end

     def self.by_bypass_token(token)
         original_token = Devise.token_generator.digest(self, :login_bypass_token, token)
         User.find_by(:login_bypass_token => original_token)
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
  


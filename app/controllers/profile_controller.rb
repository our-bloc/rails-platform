class ProfileController < ApplicationController
     before_action :set_profile, only: [:edit, :update, :destroy]
     
    def index
        @user = current_user
        @vision = Vision.find_by_user_id(@user.id)
        
     
        @users_all = User.all
    
         #loads influencer text & image
    end

    def myprofile 
        @user = current_user
        @vision = Vision.find_by_user_id(@user.id)
        @profile = current_user.profile
        
        if @referral_count != nil 
        @referral_count = User.find_by_referral_code(@user.profileurl).count 
         end
         #loads influencer text & image
        @influencers= Influencer.where(:industry => @vision.industry).where(:style => @vision.style).limit(1)
        
    end
    
    def show
        @user = User.find_by_profileurl(params[:profileurl])
        @visions = Vision.all
        @vision = Vision.find_by_user_id(@user.id)
        
        #loads influencer text & image
        @influencers= Influencer.where(:industry => @vision.industry).where(:style => @vision.style).limit(1)
        
    @referral_count = User.find_by_referral_code(@user.profileurl).count 

    end
    
   def referrals
       @referrals = User.all.order("referral_code DESC")
    end
    
    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
end

class ProfileController < ApplicationController
     before_action :set_profile, only: [:edit, :update, :destroy]
     
    def index
        @Profile = Profile.all("created_at DESC")
    end

    def myprofile 
        @user = current_user
        @vision = Vision.find_by_user_id(@user.id)
        @profile = current_user.profile
        
        if @referral_count != nil 
        @referral_count = User.find_by_referral_code(params[:profileurl]).count 
         end

        
    end
    
    def show
        @user = User.find_by_profileurl(params[:profileurl])
        @visions = Vision.all
        @vision = Vision.find_by_user_id(@user.id)
        
    
    end
    
    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
end

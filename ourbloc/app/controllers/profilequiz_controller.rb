class ProfilequizController < ApplicationController

    def myprofile 
        @user= current_user
        @vision = Vision.where(:user_id = current_user.id)
     
    end
    
end

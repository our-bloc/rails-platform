class ProfilequizController < ApplicationController
    before_action :authenticate_user!
    
    def myprofile 
        @Visions= Vision.all
        @Users= User.all
        @user= current_user
     
    end
    
end

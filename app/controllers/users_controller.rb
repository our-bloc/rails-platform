class UsersController < ApplicationController
    respond_to :html, :json
    
    def update
      @resume = User.find(params[:id])
      @resume.update_attributes(resume_params)
      respond_with @resume
    end
    
    def show
        @user = User.find(params[:id])
    end 
    
    private

      def user_params
        params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
      end
end 
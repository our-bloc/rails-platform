class WeeklyPlaylistMailer < ApplicationMailer
    default from: "amina@ourbloc.co"

      def weekly_playlist(user)
        @user = user
        mail(to: @user.email, subject: 'Your weekly playlist!')
        
        @vision = Vision.find_by_user_id(@user.id)
        @profile = @user.profile
        
        if @referral_count != nil 
        @referral_count = User.find_by_referral_code(params[:profileurl]).count 
         end
         #loads influencer text & image
         if @user.industry != nil
        @influencers= Influencer.where(:industry => @vision.industry).where(:style => @vision.style).limit(1)
          end
      end
end

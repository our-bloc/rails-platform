# Preview all emails at http://localhost:3000/rails/mailers/weekly_playlist_mailer
class WeeklyPlaylistMailerPreview < ActionMailer::Preview
      def weekly_playlist_preview
        WeeklyPlaylistMailer.weekly_playlist(User.where(:id == 10))
      end

end

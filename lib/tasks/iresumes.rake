task :iresumes => :environment do
require "capybara/poltergeist"
require 'pry'


capybara = Capybara::Session.new(:poltergeist)



# Start scraping
url = "https://www.indeed.com/account/login?dest=%2F"
capybara.visit(url)
capybara.fill_in('Email Address', with: 'info@ourbloc.co', disabled: :all)
capybara.fill_in('Password', with: 'onthebloc2016*', disabled: :all)
capybara.click_button('Sign In', disabled: :all)


    
    
        x = 5000 
        while x <= 66500
            url = "https://www.indeed.com/resumes?q=african+american&co=US&start=#{x}"
            puts x
            
            begin
                capybara.visit(url)
                resumes =  capybara.all("div#result_content a")
                resumes.each do |resume|
                    
                    
                        resume_link = resume[:href]
                        puts resume_link
                        
                            Iresume.create :name => resume.text,
                                            :description => resume_link
                    
                end
                
                x+=50
            rescue
                next
            end
            
        end
      
end

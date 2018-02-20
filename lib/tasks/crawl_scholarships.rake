task :crawl_scholarships => :environment do
require "capybara/poltergeist"
require 'pry'
require 'phantomjs'


capybara = Capybara::Session.new(:poltergeist)



# Start scraping




   x = 2
        while x < 1000
            url = "https://www.unigo.com/scholarships/minority/african-american-scholarships/#{x}"
            puts x
            
            begin
                capybara.visit(url)
                scholarships =  capybara.all(".brick")
                scholarship_links = capybara.all(".brick h3 a")
                award = capybara.all(".brick .amount")
                deadline = capybara.all(".brick .deadline")

                y=0
                
                scholarships.each do |scholarship|
                    
                        puts scholarship.text
                        puts scholarship_links[y][:href]
                        puts award[y]
                        puts deadline[y]
                      y+=1
                    
                end
                
                x+=1
            rescue
                next
            end
            
        end
    
   

  
end

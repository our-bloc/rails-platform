task :fillresumes => :environment do
require "capybara/poltergeist"
require 'pry'



capybara = Capybara::Session.new(:poltergeist)



# Start scraping



@iresumes = Iresume.where( "id > ?", 2261)
 
@iresumes.each do |iresume|
    
        next_url = "#{iresume.description}"
        puts next_url
        capybara.visit(next_url)
        body= capybara.find("body").text
        puts body
    
   
    end


end


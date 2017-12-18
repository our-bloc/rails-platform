task :jopwell_signup do
require "capybara/poltergeist"
require 'pry'


capybara = Capybara::Session.new(:poltergeist)



# Start scraping
url = "https://www.indeed.com/account/login?dest=%2F"
capybara.visit(url)
capybara.fill_in('Email Address', with: 'info@ourbloc.co', disabled: :all)
capybara.fill_in('Password', with: 'onthebloc2016*', disabled: :all)
capybara.click_button('Sign In', disabled: :all)


    next_url = "https://www.indeed.com/resumes?q=national+society+of+black+engineers&l=&cb=jt"
    capybara.visit(next_url)
    resumes =  capybara.all("div#result_content a")
    
    resumes.each do |resume|
        resume_link = resume[:href]
        puts resume_link
    end
    
     second_url = "https://www.indeed.com/resumes?q=national+society+of+black+engineers&co=US&cb=jt&start=50"
        capybara.visit(second_url)
        resumes =  capybara.all("div#result_content a")
    
    resumes.each do |resume|
        resume_link = resume[:href]
        puts resume_link
    end


    third_url = "https://www.indeed.com/resumes?q=national+society+of+black+engineers&co=US&cb=jt&start=100"
        capybara.visit(third_url)
        resumes =  capybara.all("div#result_content a")
    
    resumes.each do |resume|
        resume_link = resume[:href]
        puts resume_link
    end
end

task :jopwell_signup do
require "capybara/poltergeist"
require 'pry'
require 'phantomjs'

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


end

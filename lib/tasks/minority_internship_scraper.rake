task :minority_internship_scraper do
    
require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get("http://findinternships.com/search/label/Minorities")

internships = page.search('.post-title')
mechanize.user_agent_alias = 'Windows Chrome'

internships.each do |internship|
    puts internship.text
    link = internship.search('a')
    href = link.to_s.scan(/"([^"]*)"/)
    url = href.to_s.delete("[[").delete("]]")
    url_uri = url.to_s[1...-1]
    puts url_uri
    description_page = mechanize.get(url_uri)
    apply_link = description_page.search('button')
    
    
    puts apply_link
end



end

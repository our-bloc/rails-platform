task :jopwell_signup do
    require 'mechanize'


mechanize = Mechanize.new
page = mechanize.get("https://bigfuture.collegeboard.org/scholarship-search#!searchresults")
results = page.search('#collegePlan')

puts results

end

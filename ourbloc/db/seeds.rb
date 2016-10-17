# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admins= User.create ([{name: "Amina Yamusah", email: "amina@ourbloc.co", password: "aminabloc"}, 
{name: "Bridgette Depay", email: "about@depay.info", password: "bridgettebloc"},
{name: "Alivia Blount", email: "aliviablount@gmail.com", password: "aliviabloc"}])


sectors= [
    "Academia", 
     "Arts", 
      "Advertising, Sales, Marketing", 
       "Business", 
        "Entreprenuership", 
         "Finance & Consulting", 
          "Media & Entertainment", 
           "Law & Government", 
            "Social Impact",
             "STEM", 
              "Tech", 
               "Venture Capital & Philanthropy",
               "Talent & Diversity " 
    ]


Shares= sectors.each do |sector|
    Share.create ([{user_id: 1, sector: sector, title: "Resume template for anyone interested in " + sector, body: "Check out the link..."}])
end

Asks= sectors.each do |sector|
    Ask.create ([{user_id: 1, sector: sector, title: "Job search help!", body: "Does anyone know of dope " + sector+ " jobs to check out?"}])
end

Jobs= sectors.each do |sector|
    Job.create ([{user_id: 1, sector: sector, title: sector + " Summer Internship", description: "Full Job Description" }])
end

Resources= sectors.each do |sector|
    Resource.create ([{user_id: 1, sector: sector, title: "Cover letter example", body: "Here it is..."}])
end





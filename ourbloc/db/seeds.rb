User.delete_all
Sector.delete_all
Share.delete_all
Ask.delete_all
Job.delete_all
Resource.delete_all
Influencer.delete_all

User.create ([
  {name: "Amina Yamusah", email: "amina@ourbloc.co", password: "aminabloc"},
  {name: "Bridgette Depay", email: "about@depay.info", password: "bridgettebloc"},
  {name: "Alivia Blount", email: "aliviablount@gmail.com", password: "aliviabloc"}
])


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
  "Talent & Diversity"
]

# creating all of the categorys
sectors.each do |s|
  category = Sector.create(name: s) #don't save yet, we need to add more info
  3.times do
    Share.create ({user_id: 1, sector_id: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
    Share.create ({user_id: 2, sector_id: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
    Share.create ({user_id: 3, sector_id: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
  end

  3.times do
    Ask.create ({user_id: 1, sector_id: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"})
    Ask.create ({user_id: 2, sector_id: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"})
    Ask.create ({user_id: 3, sector_id: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"})
  end

  3.times do
    Job.create ({user_id: 1, sector_id: category.id, title: category.name + " Summer Internship", description: "Full Job Description" })
    Job.create ({user_id: 2, sector_id: category.id, title: category.name + " Summer Internship", description: "Full Job Description" })
    Job.create ({user_id: 3, sector_id: category.id, title: category.name + " Summer Internship", description: "Full Job Description" })
  end

  3.times do
    Resource.create ({user_id: 1, sector_id: category.id, title: "Cover letter example", text: "Here it is..."})
    Resource.create ({user_id: 2, sector_id: category.id, title: "Cover letter example", text: "Here it is..."})
    Resource.create ({user_id: 3, sector_id: category.id, title: "Cover letter example", text: "Here it is..."})
  end
end


Influencer.create ([
  {name: "Ryan Coogler", industry:"Griots", style: "Earn", description: " "},  
  {name: "Yaa Ygasi", industry:"Griots", style: "Olivia", description: " "},
  {name: "Kimberley Foster", industry:"Griots", style: "Issa", description: " "},
  {name: "Tanehisi Coates", industry:"Griots", style: "Jackson", description: " "},

  {name: "Cory Booker", industry:"Advocates", style: "Olivia", description: " "},  
  {name: "Laura Wiedman Powers", industry:"Advocates", style: "Issa", description: " "},  
  {name: "Donte Mills and Lennon Edwards", industry:"Advocates", style: "Jackson", description: " "},  
  {name: "Bakari Sellers", industry:"Advocates", style: "Earn", description: " "},


  {name: "B Cole", industry:"Activists", style: "Issa", description: " "},  
  {name: "Kimberley Foster", industry:"Activists", style: "Issa", description: " "}, 
  {name: "Umi Selah", industry:"Activists", style: "Earn", description: " "}, 
  {name: "Will Jackson", industry:"Activists", style: "Jackson", description: " "},

  {name: "Ivory Toldson", industry:"Educators", style: "Olivia", description: " "},  
  {name: "Alexandria Lee", industry:"Educators", style: "Issa", description: " "}, 
  {name: "Larry Irvin", industry:"Educators", style: "Earn", description: " "}, 
  {name: "Ron Porter Jr.", industry:"Educators", style: "Jackson", description: " "},
  
  {name: "Ime Archibong", industry:"Techies", style: "Olivia", description: " "},  
  {name: "Erica Baker", industry:"Techies", style: "Issa", description: " "}, 
  {name: "Leslie Miley", industry:"Techies", style: "Earn", description: " "}, 
  {name: "Nashlie Sephus", industry:"Techies", style: "Jackson", description: " "},
  
  {name: "Nashlie Sephus", industry:"Scientists", style: "Olivia", description: " "},
  {name: "Erica Baker", industry:"Scientists", style: "Issa", description: " "}, 
  {name: "Dr. Martez Prince", industry:"Scientists", style: "Earn", description: " "}, 
  {name: "Dr. Hadiyah-Nicole Green", industry:"Scientists", style: "Jackson", description: " "},
  
  {name: "Maya Watson", industry:"CSuite", style: "Olivia", description: " "},
  {name: "Erica Baker", industry:"Csuite", style: "Issa", description: " "}, 
  {name: "Nate Jones", industry:"Csuite", style: "Earn", description: " "}, 
  {name: "Chris Gray", industry:"Csuite", style: "Jackson", description: " "},
  
  {name: "Morgan Debaun", industry:"Entrepreneurs", style: "Olivia", description: " "},
  {name: "Alicia Garza", industry:"Entrepreneurs", style: "Issa", description: " "}, 
  {name: "Rodney Simpson", industry:"Entrepreneurs", style: "Earn", description: " "}, 
  {name: "Chris Gray", industry:"Entrepreneurs", style: "Jackson", description: " "},
  
  {name: "Wondaland", industry:"Artists", style: "Olivia", description: " "},
  {name: "Solange", industry:"Artists", style: "Issa", description: " "}, 
  {name: "Kevin Beasley", industry:"Artists", style: "Earn", description: " "}, 
  {name: "Misty Copeland", industry:"Artists", style: "Jackson", description: " "},

])


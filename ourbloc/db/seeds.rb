User.delete_all
Sector.delete_all
Share.delete_all
Ask.delete_all
Job.delete_all
Resource.delete_all

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

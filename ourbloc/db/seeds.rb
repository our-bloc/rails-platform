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
  category = Sector.new(name: s) #don't save yet, we need to add more info
  Share.create ({user_id: 1, sector: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
  Share.create ({user_id: 2, sector: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
  Share.create ({user_id: 3, sector: category.id, title: "Resume template for anyone interested in " + category.name, text: "Check out the link..."})
  Ask.create ([{user_id: 1, sector: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"}])
  Ask.create ([{user_id: 2, sector: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"}])
  Ask.create ([{user_id: 3, sector: category.id, title: "Job search help!", text: "Does anyone know of dope " + category.name + " jobs to check out?"}])
  Job.create ([{user_id: 1, sector: category.id, title: category.name + " Summer Internship", description: "Full Job Description" }])
  Job.create ([{user_id: 2, sector: category.id, title: category.name + " Summer Internship", description: "Full Job Description" }])
  Job.create ([{user_id: 3, sector: category.id, title: category.name + " Summer Internship", description: "Full Job Description" }])
  Resource.create ([{user_id: 1, sector: category.id, title: "Cover letter example", text: "Here it is..."}])
  Resource.create ([{user_id: 2, sector: category.id, title: "Cover letter example", text: "Here it is..."}])
  Resource.create ([{user_id: 3, sector: category.id, title: "Cover letter example", text: "Here it is..."}])
  category.save()
end

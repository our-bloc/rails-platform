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

  1.times do
    Resource.create ({user_id: 1, sector_id: category.id, title: "Check out this dope guide for applying to grad school", text: "AWP's Guide to Writing Programs is a free, searchable database of graduate and undergraduate writing programs in the US and abroad. Each member program listing contains information about faculty, admissions, requirements of study, and tuition and financial aid.
Nonmember programs can enhance their listings by joining AWP today.
For additional resources to help you in your search for writing programs, please read our program advice articles in the Writer's Notebook blog.
Use the search and browse features below to explore undergraduate and graduate writing programs.
"})
    Resource.create ({user_id: 2, sector_id: category.id, title: "Portofolios are the perfect way to show off your writing & increase your app success", text: "Check out this guide https://blog.quiet.ly/community/how-to-create-a-writing-portfolio-for-freelancers/"})
    Resource.create ({user_id: 3, sector_id: category.id, title: "Here are some of our favorite jobs board for creatives & writers text", text: "Create Daily , The Muse , Idealist"})
  end

end




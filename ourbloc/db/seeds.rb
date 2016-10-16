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


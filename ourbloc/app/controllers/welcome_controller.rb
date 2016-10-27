class WelcomeController < ApplicationController
  def home
    @sectors = Sector.all
    @academia = Sector.find_by(name: "Academia")
    @arts = Sector.find_by(name: "Arts")
    @advertising = Sector.find_by(name: "Advertising, Sales, Marketing")
    @business = Sector.find_by(name: "Business")
    @entreprenuership = Sector.find_by(name: "Entreprenuership")
    @finance = Sector.find_by(name: "Finance & Consulting")
    @entertainment = Sector.find_by(name: "Media & Entertainment")
    @government = Sector.find_by(name: "Law & Government")
    @social = Sector.find_by(name: "Social Impact")
    @stem = Sector.find_by(name: "STEM")
    @tech = Sector.find_by(name: "Tech")
    @philanthropy = Sector.find_by(name: "Venture Capital & Philanthropy")
    @talent = Sector.find_by(name: "Talent & Diversity")


  end
end

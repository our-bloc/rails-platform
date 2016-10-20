class WelcomeController < ApplicationController
  def home
    @sectors = Sector.all
  end
end

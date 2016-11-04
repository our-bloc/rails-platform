class ProfilequizController < ApplicationController
    before_action :authenticate_user!
end

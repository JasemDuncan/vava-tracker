class WelcomeController < ApplicationController
  include ApplicationHelper  
  before_action :validate_user, except: %i[show index update edit]
  
end

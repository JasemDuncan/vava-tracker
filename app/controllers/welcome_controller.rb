class WelcomeController < ApplicationController
  include ApplicationHelper  
  before_action :validate_user, except: %i[show index update edit]
  def index; end

  def show; end

end

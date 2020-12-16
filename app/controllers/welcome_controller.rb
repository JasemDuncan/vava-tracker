class WelcomeController < ApplicationController
  before_action :validate_user, except: %i[show index update edit]
  def index; end

  def show; end

  private

  def validate_user
    return if user_signed_in?

    redirect_to new_user_session_path, notice: 'For create new group you must log in first'
  end
end

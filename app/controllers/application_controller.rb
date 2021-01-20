class ApplicationController < ActionController::Base
    def validate_user
        return if user_signed_in?
    
        redirect_to new_user_session_path, notice: 'You must log in first'
      end
end

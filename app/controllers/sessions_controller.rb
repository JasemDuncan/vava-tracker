class SessionsController < ApplicationController
    def new; end
  
    # def create
    #   @user = User.find_by(name: params[:name])
    #   if @user&.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #     redirect_to user_path(@user), notice: 'Logged In'
    #   else
    #     redirect_to '/login'
    #   end
    # end
  
    # def destroy
    #     puts "jasemDUncan"
    #   session[:user_id] = nil
    #   redirect_to root_path, notice: 'Logged Out!'
    # end
  end
  
class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # Get /users/new
  def new
    @user = User.new
  end

  # POST /users/
  def create
    @user = User.new(name: params[:user][:name])

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
end

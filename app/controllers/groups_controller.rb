class GroupsController < ApplicationController
  # callback or you can use
  # before_action :authenticate_user!, only: [:create, :new]
  before_action :validate_user, except: %i[show index update edit ]
  before_action :set_group, except: %i[index new create]
  # GET group
  def index
    @groups = Group.all
  end

  # GET /groups/:id
  def show 
  end

  # Get /groups/new
  def new
    @group = Group.new
  end

  # POST /groups/
  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit; end

  # DELETE /groups/:id
  def destroy
    @group.destroy
    redirect_to groups_path
  end

  # PUT /groups/:id
  def update
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  private

  def set_group
    puts "**here set_group"
    @group = Group.find(params[:id])
  end

  def validate_user
    unless user_signed_in?
    puts "*here it is validating (validate_user)"
    redirect_to new_user_session_path, notice: 'For create new group you must log in first'
    end
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

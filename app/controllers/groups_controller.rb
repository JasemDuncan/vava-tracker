class GroupsController < ApplicationController
  # GET group
  def index
    @groups = Group.all
  end

  # GET /groups/:id
  def show
    @group = Group.find(params[:id])
  end

  # Get /groups/new
  def new
    @group = Group.new
  end

  # POST /groups/
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit
    @group=Group.find(params[:id])
  end

  #DELETE /groups/:id
  def destroy
    @group=Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  #PUT /groups/:id
  def update
    @group=Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end
  def group_params
    params.require(:group).permit(:name)
  end
end

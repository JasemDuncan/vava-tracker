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
    @group = Group.new(name: params[:group][:name])

    if @group.save
      redirect_to @group
    else
      render :new
    end
  end
end

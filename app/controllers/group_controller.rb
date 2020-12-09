class GroupController < ApplicationController
  #get group
  def index
    @groups=Group.all
  end
  #get group/:id
  def show
    @group=Group.find(params[:id])
  end
end

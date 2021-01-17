class GroupsController < ApplicationController
  include ApplicationHelper
  before_action :validate_user, except: %i[show index update edit]
  before_action :set_group, except: %i[index new create]
  # GET group
  def index
    @groups = Group.order(name: :asc)
  end

  # GET /groups/:id
  def show
    @inside_groups = Transaction.joins(:user).select('users.email,transactions.name,transactions.amount,transactions.created_at').where(group_id: params[:id])
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
    @group = Group.find(params[:id])
    Transaction.where(group_id: @group.id).update_all(group_id: '')
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
    puts '**here set_group'
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :image)
  end
end

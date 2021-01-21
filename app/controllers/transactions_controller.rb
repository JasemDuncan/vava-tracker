class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.where(user_id: current_user.id).order(created_at: :desc).includes(:user)
  end

  # GET /transactions/:id
  def show
    @transaction = Transaction.find(params[:id])
    # @transaction_image = Group.last
    # @transaction_image =  Transaction.joins("INNER JOIN groups ON groups.id = transactions.group_id WHERE groups.id=1 and transactions.id=1")
    # @transaction_image =  Group.joins("INNER JOIN transactions ON groups.id = transactions.group_id inner join active_storage_blobs on active_storage_blobs.id=groups.id  inner join active_storage_attachments on active_storage_attachments.blob_id=active_storage_blobs.id WHERE groups.id=1 and transactions.id=1")
    @transaction_image =  Group.where(id:  Transaction.select("group_id").where(group_id: '1').limit(1))
    # @inside_groups = Transaction.joins(:user).select('users.email,transactions.name,transactions.amount,transactions.created_at').where(group_id: params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  # DELETE /transactions/:id
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      render :edit
    end
  end

  def external
    # n+1
    @transactions = Transaction.where(user_id: current_user.id, group_id: nil).order(created_at: :desc).includes(:user)
  end

  # POST /transactions/
  def create
    @transaction = Transaction.new(name: params[:transaction][:name],
                                   amount: params[:transaction][:amount],
                                   user_id: current_user.id,
                                   group_id: params[:transaction][:group_id])
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end

class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.where(user_id: current_user.id).order(created_at: :desc).includes(:user)
  end

  # GET /transactions/:id
  def show
    @transaction = Transaction.find(params[:id])
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

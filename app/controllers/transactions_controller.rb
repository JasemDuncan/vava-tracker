class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /transactions/:id
  def show
    @transaction = Transaction.find(params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  def external
    #external_expenses    
    @transactions = Transaction.where(user_id: current_user.id,group_id: nil).order(created_at: :desc)
    
  end

  # POST /transactions/
  def create
    @transaction = Transaction.new(name: params[:transaction][:name],
                                   amount: params[:transaction][:amount],
                                   user_id: current_user.id,
                                   group_id: params[:transaction][:group_id] )
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end
end

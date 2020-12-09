class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/:id
  def show
    @transaction = Transaction.find(params[:id])
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /transactions/
  def create
    @transaction = Transaction.new(name: params[:transaction][:name],
                                   amount: params[:transaction][:amount])
    if @transaction.save
      redirect_to @transaction
    else
      render :new
    end
  end
end

class TransactionController < ApplicationController
  #get /transactions
  def index
    @transactions = Transaction.all
  end
  #get /transactions/:id(.:format) 
  def show
    @transaction=Transaction.find(params[:id])
  end
end

class AddUserIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :user, index: true
    add_foreign_key:transactions, :users
  end
end

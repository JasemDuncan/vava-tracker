class AddGroupIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :group, index:true
    add_foreign_key :transactions, :groups
  end
end


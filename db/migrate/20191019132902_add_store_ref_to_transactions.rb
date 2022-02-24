class AddStoreRefToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :store, foreign_key: true
  end
end

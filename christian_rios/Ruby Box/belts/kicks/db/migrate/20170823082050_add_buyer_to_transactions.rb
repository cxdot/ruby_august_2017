class AddBuyerToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :buyer, :string
  end
end

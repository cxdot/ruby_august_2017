class AddPurchasedToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :purchased, :datetime
  end
end

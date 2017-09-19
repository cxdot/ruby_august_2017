class AddSellerToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :seller, :string
  end
end

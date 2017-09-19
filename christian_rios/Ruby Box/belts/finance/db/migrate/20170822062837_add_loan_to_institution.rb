class AddLoanToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :loan, :integer
  end
end

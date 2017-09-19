class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :transactions, :shoe_id, :kickz_id
  end
end

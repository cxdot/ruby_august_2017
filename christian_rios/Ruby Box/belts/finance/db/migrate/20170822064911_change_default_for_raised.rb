class ChangeDefaultForRaised < ActiveRecord::Migration
  def change
    change_column :debitors, :raised, :integer, default: 0
  end
end

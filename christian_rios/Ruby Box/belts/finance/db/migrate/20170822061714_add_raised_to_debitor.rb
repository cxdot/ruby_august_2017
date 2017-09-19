class AddRaisedToDebitor < ActiveRecord::Migration
  def change
    add_column :debitors, :raised, :integer
  end
end

class RemoveStringFromDojo < ActiveRecord::Migration
  def change
    remove_column :dojos, :string, :string
  end
end

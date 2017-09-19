class AddUserToKickz < ActiveRecord::Migration
  def change
    add_column :kickzs, :user_id, :integer
  end
end

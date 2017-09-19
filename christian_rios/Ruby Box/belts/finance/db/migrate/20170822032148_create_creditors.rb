class CreateCreditors < ActiveRecord::Migration
  def change
    create_table :creditors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :money

      t.timestamps null: false
    end
  end
end

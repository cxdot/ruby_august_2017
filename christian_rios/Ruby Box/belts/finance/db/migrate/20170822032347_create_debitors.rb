class CreateDebitors < ActiveRecord::Migration
  def change
    create_table :debitors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :reason
      t.text :description
      t.integer :amount

      t.timestamps null: false
    end
  end
end

class CreateKickzs < ActiveRecord::Migration
  def change
    create_table :kickzs do |t|
      t.string :name
      t.integer :amount
      t.boolean :sold, :default => false

      t.timestamps null: false
    end
  end
end

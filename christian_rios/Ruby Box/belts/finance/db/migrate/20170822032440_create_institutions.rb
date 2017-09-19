class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.references :creditor, index: true, foreign_key: true
      t.references :debitor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

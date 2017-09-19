class Institution < ActiveRecord::Base
  belongs_to :creditor, required: true
  belongs_to :debitor, required: true
end

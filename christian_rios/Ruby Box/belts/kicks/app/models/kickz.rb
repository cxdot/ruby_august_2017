class Kickz < ActiveRecord::Base
    belongs_to :user, dependent: :destroy
    has_many :transactions
    
    validates :amount, presence: true, numericality: { greater_than: 10 }
    validates :name, length: 4..20
    validates_format_of :name, with: /\A[-a-z0-9' ]+\Z/i

    def downcase_fields 
        self.first_name.downcase!
        self.last_name.downcase!
        self.email.downcase!
    end
end

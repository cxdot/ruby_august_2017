class Group < ActiveRecord::Base
    belongs_to :user, required: true

    has_many :users, through: :meetups, source: :user
    has_many :meetups, dependent: :destroy
   

    validates :name, presence: true, length: { minimum: 6 }
    validates_format_of :name, with: /\A[-a-z ]+\Z/i
    validates :description, presence: true, length: { minimum: 11 }

    def downcase_fields 
    self.name.downcase!
    self.description.downcase!
    end

end

class Debitor < ActiveRecord::Base
  has_secure_password

  has_many :institutions
  has_many :creditors, through: :institutions, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: 2..30
  validates_format_of :first_name, :last_name, with: /\A[-a-z]+\Z/i
  validates :reason, presence: true, length: 10..20
  validates :description, presence: true, length: 10..50
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 100 }
  validates :email, presence: true, uniqueness: true, length: 8..50
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, on: :create, length: { minimum: 8 }

  def downcase_fields 
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end

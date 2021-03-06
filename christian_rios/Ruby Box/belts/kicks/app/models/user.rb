class User < ActiveRecord::Base
  has_secure_password

  has_many :kickz, dependent: :destroy
  has_many :transactions
  has_many :shoes_purchase, through: :transactions, source: :shoe


  validates :first_name, :last_name, presence: true, length: 2..30
  validates_format_of :first_name, :last_name, with: /\A[-a-z ]+\Z/i
  validates :email, presence: true, uniqueness: true, length: 10..50
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, on: :create, length: { minimum: 8 }

  def downcase_fields 
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end

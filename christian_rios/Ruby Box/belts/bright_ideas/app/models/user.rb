class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea


  validates :name, :alias, presence: true, length: 2..30
  validates_format_of :name, :alias, with: /\A[-a-z ]+\Z/i
  validates :email, presence: true, uniqueness: true, length: 10..50
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true, length: { minimum: 8 }

  def downcase_fields 
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end

class Student < ActiveRecord::Base
  belongs_to :dojo

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }

end

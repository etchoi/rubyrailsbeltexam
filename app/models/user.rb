class User < ActiveRecord::Base
  has_many :sells
  has_many :buys
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, :password,
  presence: true

  validates :first_name, :last_name, length: { in: 2..20 }

  validates :email,uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end

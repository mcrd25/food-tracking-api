class User < ApplicationRecord
  has_secure_password

  has_many :meal_entries
  # Validations
  validates_presence_of :email, :password_digest
end

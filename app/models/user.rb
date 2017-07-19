class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_secure_password
  enum role: ["default", "admin"]
end

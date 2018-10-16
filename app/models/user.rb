class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_presence_of :email
  # validates_presence_of :password, require: true
  has_secure_password

  enum activation: {inactive: 0, active: 1}
end

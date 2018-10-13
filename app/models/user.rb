class User < ApplicationRecord
  validates_presence_of :name,
                        :email
  validates_presence_of :password, require: true
  has_secure_password

  enum activation: {inactive: 0, active: 1}
end

class User < ApplicationRecord
  validates_presence_of :name,
                        :email
  validates_presence_of :password, require: true
  has_secure_password
end

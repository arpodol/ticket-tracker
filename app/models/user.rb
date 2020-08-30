class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: /.+@.+/
  
end

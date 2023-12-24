class AuthenticationProvider < ApplicationRecord
  has_many :admins
  has_many :admin_authentications
end

class Admin < ApplicationRecord
  translates :name

  has_one :admin_picture, dependent: :destroy
  has_one :roles_admin
  has_one :role, through: :roles_admin
  has_many :admin_login_log, :dependent=>:destroy
  accepts_nested_attributes_for :admin_picture, :allow_destroy => true

  def role?(role)
    unless self.role.present?
      return false
    end

    if self.role.role==role.to_s
      return true
    else
      return false
    end
  end

  def timeout_in
    1.day
  end
end

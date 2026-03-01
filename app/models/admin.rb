class Admin < ApplicationRecord
  translates :name

  has_one :admin_picture, -> { order id: :desc }, dependent: :destroy
  has_one :role_admin
  has_one :role, through: :role_admin
  has_many :admin_login_log, dependent: :destroy
  has_many :admin_contents, dependent: :destroy

  accepts_nested_attributes_for :role_admin, :allow_destroy => true
  accepts_nested_attributes_for :admin_picture, :allow_destroy => true
  accepts_nested_attributes_for :admin_contents, :allow_destroy => true

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

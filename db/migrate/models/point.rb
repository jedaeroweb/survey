class Point < ApplicationRecord
  belongs_to :admin
  has_many :point_logs, dependent: :destroy
end

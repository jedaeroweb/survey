class Survey < ApplicationRecord
  acts_as_votable
  belongs_to :user, counter_cache: true
  has_many :question_categories, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_one :survey_content, dependent: :destroy
  has_one :survey_picture, dependent: :destroy
end

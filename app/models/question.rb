class Question < ApplicationRecord
  validates_presence_of :question_category_id, :title
  belongs_to :question_category, counter_cache: true
  belongs_to :survey, counter_cache: true
  has_many :question_descriptions, :dependent => :destroy
  has_many :users_question, :dependent => :destroy
  has_many :answers, -> { order 'id asc' }, :dependent => :destroy
end

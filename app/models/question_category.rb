class QuestionCategory < ApplicationRecord
    validates_presence_of :title
    belongs_to :survey, counter_cache: true
    has_many :questions, :dependent=>:destroy
    has_many :users_questions, :through=>:questions
end

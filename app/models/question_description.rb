class QuestionDescription < ApplicationRecord
    validates_presence_of :question_id,:description
    belongs_to :question
end

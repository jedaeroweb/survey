class SurveyContent < ApplicationRecord
    belongs_to :survey, counter_cache: true
    validates_presence_of :content
end

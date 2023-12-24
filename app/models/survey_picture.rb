class SurveyPicture < ApplicationRecord
  belongs_to :survey, counter_cache: true
  mount_uploader :picture, SurveyPictureUploader
end

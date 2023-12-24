class CreateSurveyPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_pictures do |t|
      t.references :survey, null: false
      t.string :picture, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

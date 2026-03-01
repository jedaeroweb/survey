class CreateSurveyContents < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_contents do |t|
      t.references :survey, null: false
      t.text :content, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps
    end
  end
end

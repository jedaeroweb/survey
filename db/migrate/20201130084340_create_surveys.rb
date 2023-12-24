class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.references :user, null: false
      t.string :title, null: false, limit: 60
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :public_display, null: false, default: true
      t.boolean :enable, null: false, default: true
      t.integer :question_categories_count, null: false, default: 0
      t.integer :questions_count, null:false, default: 0
      t.integer :survey_contents_count, null:false, default: 0
      t.integer :survey_pictures_count, null:false, default: 0
      t.timestamps
    end
  end
end

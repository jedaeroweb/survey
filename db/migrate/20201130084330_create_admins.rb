class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.references :branch, null: false
      t.string :name, null: false, limit: 60
      t.date :birthday
      t.string :phone
      t.boolean :gender
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end

class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :school_type, null: false
      t.integer :grade, null: false
      t.integer :subject, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

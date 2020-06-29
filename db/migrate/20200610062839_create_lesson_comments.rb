class CreateLessonComments < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_comments do |t|
      t.text :comment, null: false
      t.references :user, foreign_key: true, null: false
      t.references :lesson, foreign_key: true, null: false

      t.timestamps
    end
  end
end

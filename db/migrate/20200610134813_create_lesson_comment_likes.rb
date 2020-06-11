class CreateLessonCommentLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_comment_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :lesson_comment, foreign_key: true, null: false

      t.timestamps
    end
  end
end

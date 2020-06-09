class ChangeLikesToLessonLikes < ActiveRecord::Migration[5.2]
  def change
    rename_table :likes, :lesson_likes
  end
end

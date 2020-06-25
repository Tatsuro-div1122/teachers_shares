class CreateCounselCommentLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :counsel_comment_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :counsel_comment, foreign_key: true, null: false

      t.timestamps
    end
  end
end

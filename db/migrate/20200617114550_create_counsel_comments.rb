class CreateCounselComments < ActiveRecord::Migration[5.2]
  def change
    create_table :counsel_comments do |t|
      t.text :comment, null: false
      t.references :user, foreign_key: true, null: false
      t.references :counsel, foreign_key: true, null: false

      t.timestamps
    end
  end
end

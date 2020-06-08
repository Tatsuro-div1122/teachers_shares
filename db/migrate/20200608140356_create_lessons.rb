class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :school_type
      t.integer :grade
      t.integer :subject
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

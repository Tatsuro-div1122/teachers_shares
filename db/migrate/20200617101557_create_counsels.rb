class CreateCounsels < ActiveRecord::Migration[5.2]
  def change
    create_table :counsels do |t|
      t.integer :category, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

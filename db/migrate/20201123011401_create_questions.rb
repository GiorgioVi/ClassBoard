class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :image_link
      t.integer :user_id
      t.string :image_file
      t.integer :course_id

      t.timestamps
    end
  end
end

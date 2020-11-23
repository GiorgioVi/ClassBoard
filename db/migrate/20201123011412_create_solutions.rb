class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.string :description
      t.string :image_link
      t.integer :user_id
      t.string :image_file
      t.integer :question_id
      t.integer :vote_count
      t.integer :course_id

      t.timestamps
    end
  end
end

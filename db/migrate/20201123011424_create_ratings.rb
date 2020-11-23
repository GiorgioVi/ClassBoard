class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :solution_id
      t.integer :vote_count

      t.timestamps
    end
  end
end

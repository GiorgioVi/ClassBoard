class AddingToRatings < ActiveRecord::Migration[6.0]
  def up
    add_column :ratings, :user_id, :integer

    add_column :ratings, :solution_poster_id, :integer

  end
end

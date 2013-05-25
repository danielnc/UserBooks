class AddRatingToUserReadBooks < ActiveRecord::Migration
  def change
    add_column :user_read_books, :rating, :integer
  end
end

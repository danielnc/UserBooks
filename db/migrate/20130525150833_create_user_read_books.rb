class CreateUserReadBooks < ActiveRecord::Migration
  def change
    create_table :user_read_books do |t|
      t.int :user_id
      t.int :book_id

      t.timestamps
    end
  end
end

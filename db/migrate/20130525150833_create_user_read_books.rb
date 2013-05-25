class CreateUserReadBooks < ActiveRecord::Migration
  def change
    create_table :user_read_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
    add_index :user_read_books, [:user_id, :book_id], :unique => true
  end
end

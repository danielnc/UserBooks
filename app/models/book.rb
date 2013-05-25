class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  validates_presence_of :title

  validates :isbn,   :isbn_format => true
  validates_uniqueness_of :isbn
  has_many :user_read_books
  has_many :users, :through => :user_read_books

  def read(user_id, rating)
    book = Book.find_by_isbn(isbn)
    if book
      id = book.id
    else
      save
    end
    read_book = UserReadBook.find_or_initialize_by_user_id_and_book_id(user_id, id)
    read_book.rating = rating
    read_book.save!
  end
end

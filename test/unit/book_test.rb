require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def book_isbn10
    Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
  end
  def book_isbn13
    Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "978-0132350884")
  end
  def create_user
    User.create(email: "danielnc@gmail.com", password: "123123123")
  end

  test "should have a valid isbn 10" do
    assert book_isbn10.save, "Saved book with a valid ISBN10"
  end

  test "should have a valid isbn 13" do
    assert book_isbn13.save, "Saved book with a valid ISBN13"
  end

  test "should not save invalid isbn" do
    wrong_isbn = book_isbn10
    wrong_isbn.isbn = "1234"
    assert !wrong_isbn.save, "Saved book without a valid ISBN"
  end

  test "should save a user rating" do
    user = create_user
    book = book_isbn13
    rating = 3
    book.read(user.id, rating)
    rate = book.user_read_books.first

    assert user.id == rate.user_id
    assert rate.rating == rating
  end

  test "rating is optional" do
    user = create_user
    book = book_isbn13
    book.read(user.id)
    rate = book.user_read_books.first

    assert user.id == rate.user_id
    assert rate.rating.nil?
  end
end

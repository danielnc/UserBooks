require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should have a valid isbn 10" do
    isbn10 = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
    assert isbn10.save, "Saved book with a valid ISBN10"
  end

  test "should have a valid isbn 13" do
    isbn13 = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "978-0132350884")
    assert isbn13.save, "Saved book with a valid ISBN13"
  end

  test "should not save invalid isbn" do
    isbn = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "1234")
    assert !isbn.save, "Saved book without a valid ISBN"
  end

end

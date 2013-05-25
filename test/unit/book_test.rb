require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should have a valid isbn 10" do
    isbn10 = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
    assert book.save, "Saved book with a valid ISBN10"
  end
end

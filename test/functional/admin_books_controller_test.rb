require 'test_helper'

class AdminBooksControllerTest < ActionController::TestCase
  tests BooksController

  setup do
    @book = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
    @book.save

    @user = User.new(email: "danielnc@gmail.com", password: "123123123")
    @user.admin = true
    @user.save
    sign_in @user
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { isbn: @book.isbn, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end

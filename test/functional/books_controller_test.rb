require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  setup do
    @book = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
    @book.save

    @user = User.new(email: "danielnc@gmail.com", password: "123123123")
    @user.save
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book and user should've read it" do
    assert_difference [ 'UserReadBook.count', 'Book.count' ], 1 do
      post :create, book: { isbn: "978-0132350884", title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_redirected_to root_path
  end

  test "should update book" do
    put :update, id: @book, book: { isbn: @book.isbn, title: @book.title }
    assert_redirected_to root_path
  end

  test "should destroy book" do
    assert_no_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to root_path
  end
end

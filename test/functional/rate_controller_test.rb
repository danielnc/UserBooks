require 'test_helper'

class RateControllerTest < ActionController::TestCase

  setup do
    @user = User.new(email: "danielnc@gmail.com", password: "123123123")
    @user.admin = true
    @user.save
    sign_in @user

    @book = Book.new(title: "Clean Code: A Handbook of Agile Software Craftsmanship", isbn: "0132350882")
    @book.read(@user.id, 5)
  end

  test "should update book" do
    put :update, id: @book, user_id: @user.id, rating: 2
    assert_redirected_to book_path(assigns(:book))
    assert UserReadBook.first.rating == 2
  end

end

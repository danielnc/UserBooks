class RateController < ApplicationController
  before_filter :ensure_admin!

  def update
    @book = Book.find(params[:id])
    read_book = @book.user_read_books.find_by_user_id(params[:user_id])
    read_book.rating = params[:rating]
    read_book.save!
    redirect_to(@book)
  end
end

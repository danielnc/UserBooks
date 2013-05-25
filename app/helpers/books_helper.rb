module BooksHelper
  def show_rating_values(user_read_books=@book.user_read_books.find_or_initialize_by_user_id(current_user.id), disabled=false)
    html = []

    1.upto(5).each { |i|
      html << radio_button_tag(:rating, i, user_read_books.rating == i, :class => "star", :disabled => disabled)
    }

    if current_user.admin?
      content = form_tag("/rate/#{@book.id}", method: :put) do
        html << hidden_field_tag(:user_id, user_read_books.user_id)
        html << submit_tag("Update", class: "btn btn-mini")
        html.join.html_safe
      end
    else
      content = html.join
    end
    content_tag(:div, content.html_safe, class: "inline-inputs")
  end
end

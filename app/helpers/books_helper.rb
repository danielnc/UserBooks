module BooksHelper
  def show_rating_values
    html = []

    1.upto(5).each { |i|
      html << radio_button_tag(:rating, i)
    }

    content_tag(:div, html.join.html_safe, class: "inline-inputs")
  end
end

class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  validates_presence_of :title

  validates :isbn,   :isbn_format => true
end

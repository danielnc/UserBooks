class Book < ActiveRecord::Base
  attr_accessible :isbn, :name
  validates_presence_of :name

  validates :isbn,   :isbn_format => true
end

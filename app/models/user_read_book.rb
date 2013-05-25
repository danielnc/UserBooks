class UserReadBook < ActiveRecord::Base
  attr_accessible :book_id, :user_id
  belongs_to :user
  belongs_to :book

  validates_numericality_of :rating, :only_integer => true, :allow_nil => true,
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to => 5,
    :message => "must be between 1 and 5."

  validates_presence_of :user_id
  validates :book_id, :uniqueness => { :scope => :user_id }
end

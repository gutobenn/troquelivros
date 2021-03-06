class BookInstance < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates_presence_of :status

  attr_accessor :distance
end

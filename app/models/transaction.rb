class Transaction < ApplicationRecord
  belongs_to :askingUser, :class_name => 'User'
  belongs_to :askedUser, :class_name => 'User'
  belongs_to :askedBook_instance, :class_name => 'BookInstance'
  belongs_to :askingBook_instance, :class_name => 'BookInstance'

end

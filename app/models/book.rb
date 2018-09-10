class Book < ApplicationRecord
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/book_missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_presence_of :name, :author
end

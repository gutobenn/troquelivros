class AddPictureToBooks < ActiveRecord::Migration[5.1]
  def up
    add_attachment :books, :picture
  end

  def down
    remove_attachment :books, :picture
  end
end

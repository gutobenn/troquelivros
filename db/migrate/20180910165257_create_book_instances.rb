class CreateBookInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :book_instances do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

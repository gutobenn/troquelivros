class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :askingUser
      t.references :askedUser
      t.references :askedBook_instance
      t.references :askingBook_instance
      t.string :type
      t.string :status
      t.string :requestDate
      t.string :returnDate
      t.string :initialDate

      t.timestamps
    end
  end
end

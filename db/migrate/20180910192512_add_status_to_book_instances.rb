class AddStatusToBookInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :book_instances, :status, :string
  end
end

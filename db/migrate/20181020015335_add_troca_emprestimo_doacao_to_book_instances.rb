class AddTrocaEmprestimoDoacaoToBookInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :book_instances, :troca, :boolean
    add_column :book_instances, :emprestimo, :boolean
    add_column :book_instances, :doacao, :boolean
  end
end

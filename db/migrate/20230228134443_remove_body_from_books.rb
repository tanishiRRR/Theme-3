class RemoveBodyFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :body, :string
  end
end

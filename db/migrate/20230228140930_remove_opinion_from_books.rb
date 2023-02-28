class RemoveOpinionFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :opinion, :string
  end
end

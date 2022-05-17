class AddStatusToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sales_status, :integer
  end
end

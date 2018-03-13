class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isinvestor, :boolean, default: :false
    add_column :users, :username, :string
  end
end

class AddInvcolumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accrediation, :string
    add_column :users, :experience, :string
    add_column :users, :details, :string
    add_column :users, :indentification, :string
  end
end

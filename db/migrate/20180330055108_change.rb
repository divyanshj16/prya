class Change < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :accrediation, :accred
    rename_column :users, :indentification, :ident
  end
end

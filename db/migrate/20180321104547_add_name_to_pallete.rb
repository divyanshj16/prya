class AddNameToPallete < ActiveRecord::Migration[5.1]
  def change
    add_column :palletes, :name, :string
  end
end

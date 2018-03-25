class AddNameToPresentation < ActiveRecord::Migration[5.1]
  def change
    add_column :presentations, :name, :string
  end
end

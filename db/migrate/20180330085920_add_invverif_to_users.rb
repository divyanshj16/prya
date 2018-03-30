class AddInvverifToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :invverif, :boolean, default: false
  end
end

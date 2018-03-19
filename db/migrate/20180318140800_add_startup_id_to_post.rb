class AddStartupIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :startup, foreign_key: true
  end
end

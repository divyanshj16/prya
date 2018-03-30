class AddPublishToPresentations < ActiveRecord::Migration[5.1]
  def change
    add_column :presentations, :publish, :boolean,default: false
  end
end

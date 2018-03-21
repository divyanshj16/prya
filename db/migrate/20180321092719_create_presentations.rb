class CreatePresentations < ActiveRecord::Migration[5.1]
  def change
    create_table :presentations do |t|
      t.string :startup
      t.string :references
      t.string :pallete
      t.string :references
      t.string :content
      t.string :text

      t.timestamps
    end
  end
end

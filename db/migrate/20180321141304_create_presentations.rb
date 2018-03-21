class CreatePresentations < ActiveRecord::Migration[5.1]
  def change
    create_table :presentations do |t|
      t.references :startup, foreign_key: true
      t.references :pallete, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end

class CreateFounderships < ActiveRecord::Migration[5.1]
  def change
    create_table :founderships do |t|
      t.references :user, foreign_key: true
      t.references :startup, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSustages < ActiveRecord::Migration[5.1]
  def change
    create_table :sustages do |t|
      t.string :stage, null: false, default: ''

      t.timestamps
    end
    add_index :sustages, :stage
  end
end

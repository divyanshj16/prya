class CreateStartupInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :startup_interests do |t|
      t.references :tag, foreign_key: true
      t.references :startup, foreign_key: true

      t.timestamps
    end
  end
end

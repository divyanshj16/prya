class CreatePalletes < ActiveRecord::Migration[5.1]
  def change
    create_table :palletes do |t|
      t.string :colors
      t.string :string

      t.timestamps
    end
  end
end

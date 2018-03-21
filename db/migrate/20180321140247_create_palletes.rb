class CreatePalletes < ActiveRecord::Migration[5.1]
  def change
    create_table :palletes do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end

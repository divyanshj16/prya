class CreateStartups < ActiveRecord::Migration[5.1]
  def change
    create_table :startups do |t|
      t.string :title
      t.string :about
      t.text :description

      t.timestamps
    end
  end
end

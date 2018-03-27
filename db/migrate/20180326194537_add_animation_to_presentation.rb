class AddAnimationToPresentation < ActiveRecord::Migration[5.1]
  def change
    add_column :presentations, :animation, :string
  end
end

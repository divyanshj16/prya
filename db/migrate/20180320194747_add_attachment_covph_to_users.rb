class AddAttachmentCovphToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :covph
    end
  end

  def self.down
    remove_attachment :users, :covph
  end
end

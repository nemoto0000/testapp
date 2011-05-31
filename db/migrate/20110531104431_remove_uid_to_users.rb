class RemoveUidToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :uid
  end

  def self.down
    add_column :users, :uid, :integer
  end
end

class AddUidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :uid, :integer
  end

  def self.down
    remove_column :users, :uid
  end
end

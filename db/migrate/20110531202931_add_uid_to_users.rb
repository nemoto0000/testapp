class AddUidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :uid, :bigint
  end

  def self.down
    remove_column :users, :uid
  end
end

class AddToageAndFromageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :toage, :integer
    add_column :users, :fromage, :integer
  end

  def self.down
    remove_column :users, :fromage
    remove_column :users, :toage
  end
end

class AddEmailAndAgeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :age, :integer
  end

  def self.down
    remove_column :users, :age
    remove_column :users, :email
  end
end

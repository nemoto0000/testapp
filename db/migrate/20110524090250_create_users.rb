class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :pic_big
      t.string :religion
      t.string :birthday
      t.string :birthday_date
      t.string :sex
      t.string :meeting_sex
      t.string :meeting_for
      t.string :tv
      t.string :movies
      t.string :books
      t.string :online_presence
      t.string :username
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

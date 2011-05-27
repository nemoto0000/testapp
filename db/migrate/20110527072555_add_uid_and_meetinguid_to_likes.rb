class AddUidAndMeetinguidToLikes < ActiveRecord::Migration
  def self.up
    add_column :likes, :uid, :integer
    add_column :likes, :meetinguid, :integer
    add_column :likes, :judge, :boolean
  end

  def self.down
    remove_column :likes, :judge
    remove_column :likes, :meetinguid
    remove_column :likes, :uid
  end
end

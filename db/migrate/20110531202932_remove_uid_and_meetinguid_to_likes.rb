class RemoveUidAndMeetinguidToLikes < ActiveRecord::Migration
  def self.up
    remove_column :likes, :uid
    remove_column :likes, :meetinguid
  end

  def self.down
    add_column :likes, :meetinguid, :integer
    add_column :likes, :uid, :integer
  end
end

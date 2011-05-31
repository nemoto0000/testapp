class AddUidAndMeetinguidToLikes < ActiveRecord::Migration
  def self.up
    add_column :likes, :uid, :bigint
    add_column :likes, :meetinguid, :bigint
  end

  def self.down
    remove_column :likes, :meetinguid
    remove_column :likes, :uid
  end
end

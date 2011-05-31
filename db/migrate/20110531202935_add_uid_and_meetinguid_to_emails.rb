class AddUidAndMeetinguidToEmails < ActiveRecord::Migration
  def self.up
    add_column :emails, :uid, :bigint
    add_column :emails, :meetinguid, :bigint
  end

  def self.down
    remove_column :emails, :meetinguid
    remove_column :emails, :uid
  end
end

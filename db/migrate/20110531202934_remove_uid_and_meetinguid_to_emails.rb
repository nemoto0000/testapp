class RemoveUidAndMeetinguidToEmails < ActiveRecord::Migration
  def self.up
    remove_column :emails, :uid
    remove_column :emails, :meetinguid
  end

  def self.down
    add_column :emails, :meetinguid, :integer
    add_column :emails, :uid, :integer
  end
end

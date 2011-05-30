class LikesController < ApplicationController
  def index
    facebook_id = session[:facebook_id]
    session[:facebook_id] = facebook_id
    @user = User.find(:first, :conditions => ["uid = ?", facebook_id])
    @client = session[:client]

    meetings = Like.where("uid = ? and judge = 't'", facebook_id)
    uids = []
    for meeting in meetings
      uids<<meeting['meetinguid']
    end
    @meetings = User.find(:all, :conditions => ["uid in (?)", uids])
  end
end

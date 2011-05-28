class LikesController < ApplicationController
  def index
    facebook_id = session[:facebook_id]
    session[:facebook_id] = facebook_id
    @user = User.find(:first, :conditions => ["uid = ?", facebook_id])
    @client = session[:client]

     meetings = Like.where('uid = ? and judge = true', facebook_id)
     @meetings = meetings
#     @targets = User.where('uid = ?', facebook_id)
   @a=0
  end

  def okey
#    v = params[:value]
    target = Like.new
    target.meetinguid =1
    target.save
  end
end

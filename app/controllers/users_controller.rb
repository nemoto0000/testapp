class UsersController < ApplicationController
  def facebook_login
     client = FacebookOAuth::Client.new(
       :application_id     => CONSUMER_KEY,
       :application_secret => CONSUMER_SECRET,
       :callback           => CALLBACK_URL
     )
    client
  end

  def oauth
    client = facebook_login # よぶ↑
    redirect_to client.authorize_url(FACEBOOK_SCOPE) #eメールも
  end

  def callback
    @client = facebook_login

    # when error occured
    if params[:error_reason]
      redirect_to @client.authorize_url(FACEBOOK_SCOPE)
    else # not error
      @client.authorize(:code => params[:code])
      facebook_id = @client.me.info["id"]
      @user = update_facebook(facebook_id, @client)
      session[:facebook_id] = @user.uid
    end
  end

  # GET /users
  # GET /users.xml
  def index
    facebook_id = session[:facebook_id]
    session[:facebook_id] = facebook_id
    @user = User.find(:first, :conditions => ["uid = ?", facebook_id])
    @client = session[:client]

    # 存在してないのに来てたらcallback飛ばす
    if @user == nil then
      redirect_to :action => callback
    end

    @user.fromage = params[:from_age]||= 0
    @user.toage = params[:to_age]||= 100
    @user.save
    # 自分以外で性別も逆
    #@targets = User.where('age > ? and age < ?', "%#{params[:from_age]}%", "%#{params[:to_age]}%")

    @targets = User.where('age >= ? and age <= ? and sex= ?', params[:from_age], params[:to_age], @user.meeting_sex)

  end

  # GET /users/1
  # GET /users/1.xml
=begin
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
=end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
=begin
  def edit
    @user = User.find(params[:id])
  end
=end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  # 使わないのかも？？
  def update
=begin
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end

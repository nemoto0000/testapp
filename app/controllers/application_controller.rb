class ApplicationController < ActionController::Base
  protect_from_forgery

  # from 環境変数
  CALLBACK_URL    = ENV['CALLBACK_URL']
  CONSUMER_KEY    = ENV['CONSUMER_KEY']
  CONSUMER_SECRET = ENV['CONSUMER_SECRET']

  FACEBOOK_FQL = "https://api.facebook.com/method/fql.query?query="
  FACEBOOK_SCOPE = {:scope => 'email, user_birthday, read_stream'}

  def get_json(facebook_id)
    require 'open-uri'
    fql = "SELECT%20uid,%20name,%20pic_big,%20religion,%20birthday,%20birthday_date,%20sex,%20meeting_sex,%20meeting_for,%20tv,%20movies,%20books,%20online_presence,%20username,%20website%20FROM%20user%20WHERE%20uid=" + facebook_id +"&format=json"
    json = FACEBOOK_FQL + fql
    src =''
    open(json) do |file|
      src = file.read
    end
    require 'json'
    paesed_json = JSON.parser.new(src[1..-2])
    paesed_json.parse()
  end

  # 個人情報の更新
  def update_facebook(facebook_id, client)
    user = User.find(:first, :conditions => ["uid = ?", facebook_id]) || User.new # なければ新規
    json = get_json(facebook_id)

    # 実際にDB更新
    # jsonで取れるデータはJSON
    user.uid = json['uid']
    user.name = json['name']
    user.email = client.me.info['email']
    #年齢計算
    age = (Time.now.strftime("%Y%m%d").to_i-Date.parse(user.birthday).strftime("%Y%m%d").to_i)/10000
    user.age = age
    user.pic_big = json['pic_big']
    user.religion = json['religion'] #とれない？
    user.birthday = client.me.info['birthday'] # GraphAPI
    user.birthday_date = json['birthday_date'] #とれない？
    user.sex = json['sex']
    user.meeting_sex = json['meeting_sex']||=(user.sex=='male')?'female':'male' #とれないので勝手に男女逆転
    user.meeting_for = json['meeting_for'] #とれない？
    user.tv = json['tv'] #とれない？
    user.movies = json['movies'] #とれない？
    user.books = json['books'] #とれない？
    user.online_presence = json['online_presence'] #とれない？
    user.username = json['username'] #とれない？
    user.website = client.me.info['link'] #とれない？
    user.save
    user
  end

end

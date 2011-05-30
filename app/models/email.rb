class Email < ActiveRecord::Base
  def self.message_choices
    choices = ['すき', '大好き', '絶交だよ', 'しらね', '愛しています', 'サランヘヨ', 'I love you.', 'mon ami']

    result = []
    for choice in choices 
      result<<[choice, choice]
    end
    result
  end
end

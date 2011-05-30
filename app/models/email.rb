class Email < ActiveRecord::Base
  def self.message_choices
    choices = ['すき', '大好き', '絶好だよ', 'しらね']

    result = []
    for choice in choices 
      result<<[choice, choice]
    end
    result
  end
end

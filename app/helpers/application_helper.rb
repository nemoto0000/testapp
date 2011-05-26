module ApplicationHelper

  def get_gender(gender)
    if gender == 'male'
      '男'
    elsif gender == 'female'
      '女'
    else
      '不明'
    end
  end
end

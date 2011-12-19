module ApplicationHelper
  
  def highlight_user_story(text)
    highlighter = '<mark>\1</mark>'
    matchers = [/(In order to)/, /(As a)/, /(I want to)/]
    matchers.each do |matcher|
      text.gsub!(matcher, highlighter)  
    end
    simple_format(text, {},:sanitize => false)
  end
   
end

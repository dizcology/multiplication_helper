module PracticeHelper

  @@replace={
    "\\times" => "&times;",
    "\\plus" => "&#43;",
    "\\minus" => "&#45;",
    "\\?" => "&#63;"
    }

  def parse(item, answer = false)
    temp=item.content
    temp.gsub!("\\?", item.answer) if answer == true
    
    @@replace.keys.each do |k|
      next unless temp.include?(k)
      temp.gsub!(k,@@replace[k])

    end
    return temp.html_safe
  end
end

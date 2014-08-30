module PracticeHelper

  @@replace={
    "\\times" => "&times;"
    }

  def parse(str)
    temp=str
    @@replace.keys.each do |k|
      next unless temp.include?(k)
      temp.gsub!(k,@@replace[k])

    end
    return temp.html_safe
  end
end

module MhHelper

  @@replace={
    "times" => "&times;"
    }

  def parse(str)
    temp=str
    @@replace.keys.each do |k|
      next unless temp.match(k)
      temp.gsub!(k,@@replace[k])

    end
    return temp.html_safe
  end
end

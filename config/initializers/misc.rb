class Array
  def accumulate(scale = true)
    result = [0.0]
    self.each do |x|
      t = x + result[-1]
      result << t
    end
    
    result = result.map{|x| x/result[-1]} if scale
    
    return result
    
  end
  
  def getPosition r
    (0...self.size).each do |i|
      next if r>self[i+1]
      return i if r <= self[i+1]
    end
    return nil
  end
end

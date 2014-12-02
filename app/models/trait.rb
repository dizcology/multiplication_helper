class Trait < ActiveRecord::Base
  has_many :user_traits
  #has_many :events
  has_many :records
  
  def items
    nm = self.name
    Item.where("tag = ?", nm)
  end
  
end

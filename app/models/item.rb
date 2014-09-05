class Item < ActiveRecord::Base
  has_many :events
  has_many :records, through: :events
  
  def traits
    # item traits are recorded in the tag string in the form "trait1|trait2|..."
    Trait.where(name: self.name.split("|"))
  end
  

end

class UserTrait < ActiveRecord::Base
  belongs_to :user
  belongs_to :trait
  
  def weight
    pWeight = 10.0 #weight for portion... move to model profile model
    count = Record.count.to_f
    thisCount = self.n
    meanCount = count / Trait.count
    target = 10.0 #target user_trait value... move to model profile model
    
    d1 = (target-self.value).abs
    d2 = (thisCount>meanCount)? 0: pWeight*((meanCount - thisCount)/meanCount).abs
    
    return d1 + d2 
    
  end
end

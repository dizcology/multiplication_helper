class PracticeController < ApplicationController
  
  def index
    
    
    current_user = User.first #this shouldn't be here, but i am not sure how to pass the current_user variable from the controller mh to the controller practice
    
    #this does very little except for recording the show item time stamp, which is already in the submit event
    #Event.new(user: current_user, item_id: @item.id, event_type: "show item").save
    
    if flash[:record]
      @record = Record.find_by(id: flash[:record]) if flash[:record]
      @item = Item.find_by(id: @record.event.item_id)
      @event = Event.new(user: current_user, item_id: @item.id, event_type: "feedback")
      @event.save
      
    else
      @item = getItem(current_user) #need an algorithm to select items based on user trait values and encounter history
      @event = Event.new(user: current_user, item_id: @item.id, event_type: "submit")
      @event.save
      
    end
    
  end
  
  def getItem user
    
    return Item.all.sample if Record.where(user: user).size == 0
    
    user_traits = UserTrait.where(user: user)
    wts = user_traits.map(&:weight).accumulate
    
    nPool = 5 #pool of traits to sample from... move to model profile model
    
    item_pool = []
    nPool.times.each do
      item_pool += user_traits[wts.getPosition(rand)].trait.items
    end
    
    return item_pool.sample
  end

end







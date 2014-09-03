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
      @item = Item.all.sample #need an algorithm to select items based on user trait values and encounter history
      @event = Event.new(user: current_user, item_id: @item.id, event_type: "submit")
      @event.save
      
    end
    
  end

end

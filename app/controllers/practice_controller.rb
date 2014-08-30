class PracticeController < ApplicationController
  
  def index
    @item = Item.all.sample
    
    current_user = User.first #this shouldn't be here, but i am not sure how to pass the current_user variable from the controller mh to the controller practice
    
    Event.new(user: current_user, item_id: @item.id, event_type: "show item").save
    
    @event = Event.new(user: current_user, item_id: @item.id, event_type: "submit")
    @event.save
    
  end

end

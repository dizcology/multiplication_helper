class MhController < ApplicationController

  def index
    @item = Item.all.sample
    
    current_user = User.first
    
    Event.new(user: current_user, item_id: @item.id, event_type: "show item").save
    
    @event = Event.new(user: current_user, item_id: @item.id, event_type: "submit")
    @event.save
    
    
  end

end

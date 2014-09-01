class EventsController < ApplicationController
  def update  
    
    @event = Event.find_by(id: params[:id])
    
    @event.response = params[:event][:response]
    @event.save
    
    res = (@event.response.strip == Item.find_by(id: @event.item_id).answer)
    dur = @event.updated_at - @event.created_at
    
    rec = Record.new(user_id: @event.user_id, item_id:@event.item_id, event_id: @event.id, result: res, duration: dur)
    rec.save
    
    flash[:record] = rec.id
    
    redirect_to(controller: "practice") 
  end
end

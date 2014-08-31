class EventsController < ApplicationController
  def submit  #right now this is only for updating submit events, not sure how to have a generic event updater that controls all the event updates.
    
    @event = Event.find_by(id: params[:id])
    
    @event.response = params[:event][:response]
    @event.save
    
    res = (@event.response.strip == Item.find_by(id: @event.item_id).answer)
    dur = @event.updated_at - @event.created_at
    
    rec = Record.new(user_id: @event.user_id, item_id:@event.item_id, event_id: @event.id, result: res, duration: dur)
    rec.save
    
    redirect_to(controller: "practice", record: rec.id.to_param)
  end
end

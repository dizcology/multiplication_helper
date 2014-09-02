class EventsController < ApplicationController
  def update  
    
    #update event:
    
    @event = Event.find_by(id: params[:id])
    
    @event.response = params[:event][:response]
    @event.save
    
    item = Item.find_by(id: @event.item_id)
    user = User.find_by(id: @event.user_id)
    
    # update record:
    
    res = (@event.response.strip == item.answer)
    dur = @event.updated_at - @event.created_at
    
    rec = Record.new(user_id: user.id, item_id: item.id, event_id: @event.id, result: res, duration: dur)
    rec.save
    
    #update trait:
    #the model should be refined to take into account of learning, for example we should at least weight the more recent records higher; perhaps try the reverse exponential decay model (with an arbitrary base).
    
    s = 0.1 #slip... to be moved to model profile model
    g = 0.01  #guess... to be moved to model profile model 
    
    tr = Trait.find_by(user_id: user.id)
    
    if res
      tr[(item.name).to_sym] += Math.log((1-s)/g)
    else
      tr[(item.name).to_sym] += Math.log(s/(1-g))
    end
    
    tr.save
    
    #pass flash message for feedback
    
    flash[:record] = rec.id
    
    redirect_to(controller: "practice") 
  end
end

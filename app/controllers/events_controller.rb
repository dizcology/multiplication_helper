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
    
    s = 0.1 #slip... to be moved to model profile model
    g = 0.01  #guess... to be moved to model profile model 
    f = 2.0 #forget... to be moved to model profile model
    
    tr = Trait.find_by(user_id: user.id)
    
    last_rec = Record.where(user: user.id, item: item.id).last
    
    if last_rec
      y_since_last = rec.created_at.year - last_rec.created_at.year
      d_since_last = rec.created_at.day - last_rec.created_at.day
      
      gap = (365*y_since_last+d_since_last).to_f  #maybe there is a better way to get the number of days between two dates
      tr[(item.name).to_sym] /= f**(gap)
      
    end
    
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

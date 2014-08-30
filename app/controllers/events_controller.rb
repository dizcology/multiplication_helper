class EventsController < ApplicationController
  def update
    @event = Event.find_by(id: params[:id])
    
    @event.response = params[:event][:response]
    @event.save
    
    redirect_to :root
  end
end

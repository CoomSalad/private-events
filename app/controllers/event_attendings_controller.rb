class EventAttendingsController < ApplicationController
  def create
    @event_attending = current_user.event_attendings.build
    @event_attending.attended_event_id = params[:event_id]
    if @event_attending.save
      redirect_to request.referrer, notice: "You're being redirected"
    end
  end

  def destroy
    @event_attending = EventAttending.find(params[:id])
    if @event_attending.destroy
      redirect_to request.referrer, notice: "You're being redirected"
    end
  end
end

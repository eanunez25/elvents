class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(created_events_params)
    if @event.save
      flash[:success] = "Event saved!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_attendees = @event.event_attendees.all
  end

  def index
    @events = Event.all
    @past = Event.past
    @today = Event.today
    @upcoming = Event.upcoming
  end

  private

    def created_events_params
      params.require(:event).permit(:name, :date, :description)
    end

end

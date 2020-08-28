class EventsController < ApplicationController
  def index; end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'Event has been created'
      redirect_to events_path
    else
      flash[:alert] = 'Something wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end

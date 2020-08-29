class EventsController < ApplicationController
  before_action :require_user, except: [:index]
  def index
  	@past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'Event has been created'
      redirect_to events_path
    else
      flash[:danger] = 'Something wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @event.attendees.each do |e|
      @users = User.where.not(name: e.name).where.not(name: @event.creator.name)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end

# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :log_in_user, only: [:create]

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(id: @event.id)
    else
      render 'new'
    end
  end

  def index
    @events = Event.all
    @past_events = @events.past
    @upcoming_events = @events.upcoming
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @is_upcoming = Event.upcoming.include?(@event)
  end

  private

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :time)
  end

  def log_in_user
    unless logged_in?
      flash[:danger] = "You must log in before creating an event"
      redirect_to login_path
    end
  end
end

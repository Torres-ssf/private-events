# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :log_in_user, only: [:create, :show]

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
    @event = Event.find(params[:id])
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

# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in_user, only: :create

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
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event)
          .permit(:name, :description, :location, :time)
  end

  def logged_in_user
    redirect_to login_path unless logged_in?
  end
end

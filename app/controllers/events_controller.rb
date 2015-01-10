class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def root
    @events = Event.all
    respond_with(@events)
  end

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :title, :opendate, :opendate_memo, :address, :postal, :address_embed, :fee, :limit, :desc_short, :desc_long, :picture_main, :picture_1, :picture_2, :picture_3, :url, :url_facebook, :url_twitter, :visible)
    end
end

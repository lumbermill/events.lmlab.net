class EntriesController < ApplicationController
  respond_to :html

  def new
    @entry = Entry.new
    @entry.event_id = params[:event_id]
    respond_with(@entry)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = 'お申し込みを受け付けました。'
      if session[:entries].nil?
        session[:entries] = {}
      end
      session[:entries][@entry.event_id.to_s] = DateTime.now
      redirect_to controller: 'events', action: 'show', id: @entry.event_id
    else
      render :new
    end
  end

  def index
    event_id = params[:event_id]
    @event = Event.find(event_id)
    unless current_user.id == @event.user.id
      raise 'This event is not owned by you.'
    end
    @entries = Entry.where(event_id: event_id).order("created_at desc")
  end

  def toggle
    e = Entry.find(params[:id])
    raise "Entry not found for #{params[:id]}." unless e
    e.active = !e.active
    e.save!
    render plain: "OK"
  end

  private
    def entry_params
      params.require(:entry).permit(:event_id, :email, :name, :message)
    end
end

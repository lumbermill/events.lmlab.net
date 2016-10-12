class EntriesController < ApplicationController
  respond_to :html

  def new
    @entry = Entry.new
    @entry.event_id = params[:event_id]
    respond_with(@entry)
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    respond_with(@entry)
  end

  private
    def entry_params
      params.require(:entry).permit(:event_id, :email, :name, :message)
    end
end

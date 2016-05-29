class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :show_picture, :duplicate]
  before_action :authenticate_user!, except: [:root, :pasts, :show, :show_picture, :index_by_user]

  respond_to :html

  def root
    @events = Event.where("opendate >= ? AND visible = true",Date.today.to_s).order("opendate").limit(12)
    respond_with(@events)
  end

  def index
    # Use for user home
    @upcomings = Event.where("opendate >= ? AND user_id = ?",Date.today.to_s,current_user.id).order("opendate ASC")
    @ends = Event.where("opendate < ? AND user_id = ?",Date.today.to_s,current_user.id).order("opendate DESC")
    respond_with(@upcomings,@ends)
  end

  def index_by_user
    @user = User.find(params[:id])
    raise ActionController::RoutingError.new('User not found.') unless @user
    @upcomings = Event.where("opendate >= ? AND user_id = ? AND visible = true",Date.today.to_s,@user.id).order("opendate ASC")
    @ends = Event.where("opendate < ? AND user_id = ? AND visible = true",Date.today.to_s,@user.id).order("opendate DESC")
  end

  def pasts
    @ends = Event.where("opendate < ? AND visible = true",Date.today.to_s).order("opendate DESC")
    respond_with(@ends)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    @event.user_id = current_user.id
    respond_with(@event)
  end

  def edit
    if current_user.id != @event.user_id
      raise ActionController::RoutingError.new('This event is not yours.')
    end
  end

  def duplicate
    if current_user.id != @event.user_id
      raise ActionController::RoutingError.new('This event is not yours.')
    end
    #@event.id = nil
    @event.visible = false # Always invisible after duplication.
  end

  def create
    @event = Event.new(event_params)
    if params[:event][:id]
      # from duplicate
      orig = Event.find(params[:event][:id])
      @event.picture_main = orig.picture_main
      @event.picture_1 = orig.picture_1
      @event.picture_2 = orig.picture_2
      @event.picture_3 = orig.picture_3
    end
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

  def show_picture
    n = "picture_"+ (params["name"] || "main")
    d = @event.send(n)
    if d
      send_data d, :type => 'image/jpeg', :disposition => "inline"
    else
      raise ActionController::RoutingError.new('Picture of '+@event.title+' '+n+' not found')
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def adjust_image(b)
      require 'RMagick'
      i = Magick::Image.from_blob(b.read)[0]
      if i.columns > 1024
        return i.resize(0.5).to_blob
      else
        return i.to_blob
      end
    end

    def event_params
      p = params.require(:event).permit(:user_id, :title, :opendate, :opendate_memo, :address_title, :address, :postal, :address_embed, :fee, :fee_memo, :limit, :desc_short, :desc_long, :picture_main, :picture_1, :picture_2, :picture_3, :url, :url_facebook, :url_twitter, :visible, :host)
      [:picture_main,:picture_1,:picture_2,:picture_3].each do |k|
        p[k] = adjust_image(p[k]) if p[k]
      end
      return p
    end
end

require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, address_embed: @event.address_embed, desc_long: @event.desc_long, desc_short: @event.desc_short, fee: @event.fee, limit: @event.limit, opendate: @event.opendate, opendate_memo: @event.opendate_memo, picture_1: @event.picture_1, picture_2: @event.picture_2, picture_3: @event.picture_3, picture_main: @event.picture_main, postal: @event.postal, title: @event.title, url: @event.url, url_facebook: @event.url_facebook, url_twitter: @event.url_twitter, user_id: @event.user_id, visible: @event.visible }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { address: @event.address, address_embed: @event.address_embed, desc_long: @event.desc_long, desc_short: @event.desc_short, fee: @event.fee, limit: @event.limit, opendate: @event.opendate, opendate_memo: @event.opendate_memo, picture_1: @event.picture_1, picture_2: @event.picture_2, picture_3: @event.picture_3, picture_main: @event.picture_main, postal: @event.postal, title: @event.title, url: @event.url, url_facebook: @event.url_facebook, url_twitter: @event.url_twitter, user_id: @event.user_id, visible: @event.visible }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end

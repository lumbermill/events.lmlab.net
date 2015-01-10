require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post :create, report: { event_id: @report.event_id, long_desc: @report.long_desc, picture_1: @report.picture_1, picture_2: @report.picture_2, picture_3: @report.picture_3, short_desc: @report.short_desc, visible: @report.visible }
    end

    assert_redirected_to report_path(assigns(:report))
  end

  test "should show report" do
    get :show, id: @report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report
    assert_response :success
  end

  test "should update report" do
    patch :update, id: @report, report: { event_id: @report.event_id, long_desc: @report.long_desc, picture_1: @report.picture_1, picture_2: @report.picture_2, picture_3: @report.picture_3, short_desc: @report.short_desc, visible: @report.visible }
    assert_redirected_to report_path(assigns(:report))
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete :destroy, id: @report
    end

    assert_redirected_to reports_path
  end
end

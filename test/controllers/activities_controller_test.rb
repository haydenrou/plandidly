require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
    @trip = @activity.trip
  end

  test "should get new" do
    get new_trip_activity_url(@trip)
    assert_response :success
  end

  test "should create activity" do
    assert_difference("Activity.count") do
      post trip_activities_url(@trip), params: { activity: { address: @activity.address, end_at: @activity.end_at, reference_number: @activity.reference_number, start_at: @activity.start_at, title: @activity.title, trip_id: @activity.trip_id } }
    end

    assert_redirected_to trip_url(@trip)
  end

  test "should show activity" do
    get trip_activity_url(@trip, @activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_activity_url(@trip, @activity)
    assert_response :success
  end

  test "should update activity" do
    patch trip_activity_url(@trip, @activity), params: { activity: { address: @activity.address, end_at: @activity.end_at, reference_number: @activity.reference_number, start_at: @activity.start_at, title: @activity.title, trip_id: @activity.trip_id } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete trip_activity_url(@trip, @activity)
    end

    assert_redirected_to trip_url(@trip)
  end
end

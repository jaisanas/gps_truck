require 'test_helper'

class GpsTrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gps_truck = gps_trucks(:one)
  end

  test "should get index" do
    get gps_trucks_url
    assert_response :success
  end

  test "should get new" do
    get new_gps_truck_url
    assert_response :success
  end

  test "should create gps_truck" do
    assert_difference('GpsTruck.count') do
      post gps_trucks_url, params: { gps_truck: {  } }
    end

    assert_redirected_to gps_truck_url(GpsTruck.last)
  end

  test "should show gps_truck" do
    get gps_truck_url(@gps_truck)
    assert_response :success
  end

  test "should get edit" do
    get edit_gps_truck_url(@gps_truck)
    assert_response :success
  end

  test "should update gps_truck" do
    patch gps_truck_url(@gps_truck), params: { gps_truck: {  } }
    assert_redirected_to gps_truck_url(@gps_truck)
  end

  test "should destroy gps_truck" do
    assert_difference('GpsTruck.count', -1) do
      delete gps_truck_url(@gps_truck)
    end

    assert_redirected_to gps_trucks_url
  end
end

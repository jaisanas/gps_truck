require 'test_helper'

class GpsTruckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "latitude cannot be blank" do
    gps_truck = GpsTruck.new '','','','','',''
    assert gps_truck.invalid?
  end
end

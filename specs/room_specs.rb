require('minitest/autorun')
require('minitest/rg')
require_relative('../room')

class TestRoom

  def setup
    @room = Room.new()
  end

  def test_room_has_capacity
    assert_equal(6, @room.capacity)
  end
end

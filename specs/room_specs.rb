require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new()
    @song1 = Song.new('Remedy', 'My Baby')
    @guest1 = Guest.new('Bob', 20, @song1)
    @guest2 = Guest.new('Sally', 20, @song1)
  end

  def test_room_has_capacity
    assert_equal(6, @room.capacity)
  end

  def test_can_push_guests_to_room
    @room.guests.push(@guest1)
    @room.guests.push(@guest2)
    assert_equal(2, @room.guests.length)
  end
end

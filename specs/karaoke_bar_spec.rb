require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')
require_relative('../room')
require_relative('../bar')
require_relative('../till')

class TestKaraokeBar < MiniTest::Test
  def setup
    till1 = Till.new('bar-room1')
    bar1 = Bar.new(till1)
    room1 = Room.new(bar1)
    till2 = Till.new('bar-room2')
    bar2 = Bar.new(till2)
    room2 = Room.new(bar2)
    rooms = [room1, room2]
    @karaoke_bar = KaraokeBar.new('CodeClan Caraoke', rooms)
  end

  def test_karaoke_bar_has_name
    assert_equal('CodeClan Caraoke', @karaoke_bar.name)
  end

  def test_karaoke_bar_has_empty_rooms
    assert_equal(0, @karaoke_bar.rooms[0].guests.length)
    assert_equal(0, @karaoke_bar.rooms[1].guests.length)
  end
end

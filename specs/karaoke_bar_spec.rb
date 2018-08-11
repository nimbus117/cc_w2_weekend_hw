require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')
require_relative('../room')
require_relative('../bar')
require_relative('../till')
require_relative('../guest')
require_relative('../song')

class TestKaraokeBar < MiniTest::Test
  def setup
    till1 = Till.new('bar-room1')
    bar1 = Bar.new(till1)
    room1 = Room.new(bar1)
    till2 = Till.new('bar-room2')
    bar2 = Bar.new(till2)
    room2 = Room.new(bar2)
    rooms = [room1, room2]
    till3 = Till.new('front-desk')
    @karaoke_bar = KaraokeBar.new('CodeClan Caraoke', rooms, till3)
    @song1 = Song.new('Remedy', 'My Baby')
    @poor_guest = Guest.new('Tim', 5, @song1)
    @guest1 = Guest.new('Bob', 20, @song1)
  end

  def test_karaoke_bar_has_name
    assert_equal('CodeClan Caraoke', @karaoke_bar.name)
  end

  def test_karaoke_bar_has_empty_rooms
    assert_equal(0, @karaoke_bar.rooms[0].guests.length)
    assert_equal(0, @karaoke_bar.rooms[1].guests.length)
  end

  def test_karaoke_bar_has_empty_till
    assert_equal(0, @karaoke_bar.till.money)
  end

  def test_karaoke_bar_can_check_in_guest
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0].guests, @guest1)
    assert_equal(10, @karaoke_bar.till.money)
    assert_equal(10, @guest1.wallet)
    assert_equal(1, @karaoke_bar.rooms[0].guests.length)
  end

  def test_karaoke_bar_can_check_in_guest__not_enough_money
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0].guests, @poor_guest)
    assert_equal(0, @karaoke_bar.till.money)
    assert_equal(5, @poor_guest.wallet)
    assert_equal(0, @karaoke_bar.rooms[0].guests.length)
  end
end

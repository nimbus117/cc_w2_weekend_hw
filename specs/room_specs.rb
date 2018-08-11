require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')
require_relative('../bar')
require_relative('../till')

class TestRoom < MiniTest::Test

  def setup
    drink1 = Drink.new('Bud', 'Beer', 3)
    drink2 = Drink.new('Coors', 'Beer', 3)
    drink3 = Drink.new('Bowmore', 'Whisky', 5)
    drink4 = Drink.new('Glenmorangie', 'Whisky', 5)
    @drinks = [drink1, drink2, drink3, drink4]
    till = Till.new('bar-room1')
    bar = Bar.new(till)
    @room = Room.new(bar)
    @song1 = Song.new('Remedy', 'My Baby')
    @song2 = Song.new('One', 'Metallica')
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

  def test_can_delete_guests_from_room
    @room.guests.push(@guest1)
    @room.guests.push(@guest2)
    @room.guests.delete(@guest1)
    assert_equal(1, @room.guests.length)
  end

  def test_can_push_songs_to_room
    @room.songs.push(@song1)
    @room.songs.push(@song2)
    assert_equal(2, @room.songs.length)
  end

  def test_room_has_working_bar
    @room.bar.add_drinks(@drinks)
    @room.bar.buy_drink(@guest1, @drinks[3])
    assert_equal(5, @room.bar.till.money)
    assert_equal(15, @guest1.wallet)
  end

  def test_guest_can_check_if_room_has_fav_song
    @room.songs.push(@song1)
    @room.guests.push(@guest1)
    assert_equal('Whoo!', @room.guests[0].check_for_fav_song(@room.songs))
  end
end

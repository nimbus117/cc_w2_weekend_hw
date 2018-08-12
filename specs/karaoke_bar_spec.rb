require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')
require_relative('../room')
require_relative('../bar')
require_relative('../till')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')

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
    @guest2 = Guest.new('Ben', 20, @song1)
    @guest3 = Guest.new('Barry', 20, @song1)
    @guest4 = Guest.new('Babs', 20, @song1)
    @guest5 = Guest.new('Betty', 20, @song1)
    @guest6 = Guest.new('Bernadette', 20, @song1)
    @guest7 = Guest.new('Frank', 20, @song1)
    drink1 = Drink.new('Bud', 'Beer', 3)
    drink2 = Drink.new('Coors', 'Beer', 3)
    drink3 = Drink.new('Bowmore', 'Whisky', 5)
    drink4 = Drink.new('Glenmorangie', 'Whisky', 5)
    @drinks = [drink1, drink2, drink3, drink4]
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
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest1)
    assert_equal(10, @karaoke_bar.till.money)
    assert_equal(10, @guest1.wallet)
    assert_equal(1, @karaoke_bar.rooms[0].guests.length)
  end

  def test_karaoke_bar_can_check_in_guest__not_enough_money
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @poor_guest)
    assert_equal(0, @karaoke_bar.till.money)
    assert_equal(5, @poor_guest.wallet)
    assert_equal(0, @karaoke_bar.rooms[0].guests.length)
  end

  def test_karaoke_bar_can_check_in_guest__room_at_capacity
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest1)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest2)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest3)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest4)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest5)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest6)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest7)
    assert_equal(6, @karaoke_bar.rooms[0].guests.length)
    assert_equal(60, @karaoke_bar.till.money)
  end

  def test_karaoke_bar_can_check_out_guest
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest1)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest2)
    @karaoke_bar.check_out_guest(@karaoke_bar.rooms[0], @guest1)
    assert_equal(1, @karaoke_bar.rooms[0].guests.length)
  end

  def test_karaoke_bar_add_songs_to_all_rooms
    song1 = Song.new('Remedy', 'My Baby')
    song2 = Song.new('One', 'Metallica')
    song3 = Song.new('Uprising', 'My Baby')
    songs = [song1, song2, song3]
    @karaoke_bar.add_songs_to_all_rooms(songs)
    assert_equal(3, @karaoke_bar.rooms[0].songs.length)
    assert_equal(3, @karaoke_bar.rooms[1].songs.length)
  end

  def test_karaoke_bar_add_drinks_to_all_bars
    @karaoke_bar.add_drinks_to_all_bars(@drinks)
    assert_equal(4, @karaoke_bar.rooms[0].bar.drinks.length)
    assert_equal(4, @karaoke_bar.rooms[1].bar.drinks.length)
  end

  def test_karaoke_bar_get_till_report

    expected_report = [
      {
        id: 'front-desk',
        money: 70
      },
      {
        id: 'bar-room1',
        money: 5
      },
      {
        id: 'bar-room2',
        money: 3
      },
      {
        id: 'total',
        money: 78
      }
    ]
    # check in guests to both rooms
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest1)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest2)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest3)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[0], @guest4)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[1], @guest5)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[1], @guest6)
    @karaoke_bar.check_in_guest(@karaoke_bar.rooms[1], @guest7)
    # add drinks to all rooms and have guests buy some
    @karaoke_bar.add_drinks_to_all_bars(@drinks)
    @karaoke_bar.rooms[0].bar.buy_drink(@guest1, @drinks[3])
    @karaoke_bar.rooms[1].bar.buy_drink(@guest6, @drinks[0])

    assert_equal(expected_report, @karaoke_bar.get_till_report())
  end
end

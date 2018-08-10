require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new('Remedy', 'My Baby')
    @song2 = Song.new('One', 'Metallica')
    @songs = [@song1, @song2]
    @guest1 = Guest.new('Bob', 20, @song1)
    @guest2 = Guest.new('Bob', 30, @song2)
  end

  def test_guest_has_name
    assert_equal('Bob', @guest1.name)
  end

  def test_guest_has_wallet
    assert_equal(30, @guest2.wallet)
  end

  def test_guest_has_fav_song
    assert_equal(@song1, @guest1.fav_song)
  end

  def test_guest_can_remove_money_from_wallet
    assert_equal(17, @guest1.remove_money(3))
  end
end

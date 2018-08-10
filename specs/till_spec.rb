require('minitest/autorun')
require('minitest/rg')
require_relative('../till')
require_relative('../guest')
require_relative('../song')

class TestTill < MiniTest::Test
  def setup
    song1 = Song.new('Remedy', 'My Baby')
    @guest1 = Guest.new('Bob', 20, song1)
    @till1 = Till.new('till-1234')
  end

  def test_till_has_id
    assert_equal('till-1234', @till1.id)
  end

  def test_till_has_no_money
    assert_equal(0, @till1.money)
  end

  def test_till_can_take_payment
    @till1.take_payment(@guest1, 5)
    assert_equal(5, @till1.money)
    assert_equal(15, @guest1.wallet)
  end
end

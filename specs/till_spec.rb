require('minitest/autorun')
require('minitest/rg')
require_relative('../till')

class TestTill < MiniTest::Test
  def setup
    @till1 = Till.new('till-1234')
  end

  def test_till_has_id
    assert_equal('till-1234', @till1.id)
  end

  def test_till_has_no_money
    assert_equal(0, @till1.money)
  end
end

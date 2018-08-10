require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new('Bud', 'Beer', 3)
  end

  def test_drink_has_name
    assert_equal('Bud', @drink.name)
  end

  def test_drink_has_type
    assert_equal('Beer', @drink.type)
  end

  def test_drink_has_price
    assert_equal(3, @drink.price)
  end

end

require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../bar')
require_relative('../till')

class TestBar < MiniTest::Test

  def setup
    drink1 = Drink.new('Bud', 'Beer', 3)
    drink2 = Drink.new('Coors', 'Beer', 3)
    drink3 = Drink.new('Bowmore', 'Whisky', 5)
    drink4 = Drink.new('Glenmorangie', 'Whisky', 5)
    @drinks = [drink1, drink2, drink3, drink4]
    till = Till.new('bar-room1')
    @bar = Bar.new(till)
  end

  def test_bar_has_empty_till
    assert_equal(0, @bar.till.money)
  end

  def test_bar_can_add_drinks
    @bar.add_drinks(@drinks)
    assert_equal(4, @bar.drinks.length)
  end

  def test_bar_get_drinks_by_type
    @bar.add_drinks(@drinks)
    assert_equal(2, @bar.get_drinks_by_type('Beer').length)
  end
end


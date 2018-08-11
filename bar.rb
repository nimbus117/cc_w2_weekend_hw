class Bar
  attr_reader(:drinks, :till)

  def initialize(till)
    @till = till
    @drinks = []
  end

  def get_drinks_by_type(type)
    drinks_of_type = @drinks.find_all {|drink| drink.type == type}
    drinks_of_type.map {|drink| drink.name}
  end

  def get_drink_by_name(name)
    @drinks.find {|drink| drink.name == name}
  end

  def buy_drink(guest, drink)
    @till.take_payment(guest, drink.price)
  end
end

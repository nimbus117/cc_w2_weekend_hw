class Bar
  attr_reader(:drinks, :till)

  def initialize(till)
    @till = till
    @drinks = []
  end

  def add_drinks(drinks_to_add)
    @drinks.concat(drinks_to_add)
  end

  def get_drinks_by_type(type)
    @drinks.find_all {|drink| drink.type == type}
  end
end

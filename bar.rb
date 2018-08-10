class Bar
  attr_reader(:drinks, :till)

  def initialize(till)
    @till = till
    @drinks = []
  end

  def add_drinks(drinks_to_add)
    @drinks.concat(drinks_to_add)
  end
end

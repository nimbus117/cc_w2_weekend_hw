class Bar
  attr_reader(:drinks, :till)

  def initialize(till)
    @till = till
  end
end

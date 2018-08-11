class Room
  attr_reader(:capacity, :guests)

  def initialize
    @capacity = 6
    @guests = []
  end
end

class Room
  attr_reader(:capacity, :guests, :songs, :bar)

  def initialize(bar)
    @capacity = 6
    @guests = []
    @songs = []
    @bar = bar
  end
end

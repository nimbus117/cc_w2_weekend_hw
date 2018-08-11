class Room
  attr_reader(:capacity, :guests, :songs)

  def initialize
    @capacity = 6
    @guests = []
    @songs = []
  end
end

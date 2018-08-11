class KaraokeBar
  attr_reader(:name, :rooms, :till)
  
  def initialize(name, rooms, till)
    @name = name
    @rooms = rooms
    @till = till
  end
end

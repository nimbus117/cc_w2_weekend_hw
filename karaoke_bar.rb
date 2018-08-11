class KaraokeBar
  attr_reader(:name, :rooms, :till)
  
  def initialize(name, rooms, till)
    @name = name
    @rooms = rooms
    @till = till
    @price = 10
  end

  def check_in_guest(room, guest)
    payment = @till.take_payment(guest, @price)
    if payment
      room.push(guest)
    end
  end
end

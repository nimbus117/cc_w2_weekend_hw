class KaraokeBar
  attr_reader(:name, :rooms, :till)
  
  def initialize(name, rooms, till)
    @name = name
    @rooms = rooms
    @till = till
    @price = 10
  end

  def check_in_guest(room, guest)
    if room.guests.length < room.capacity
      payment = @till.take_payment(guest, @price)
      if payment
        room.guests.push(guest)
      end
    end
  end

  def check_out_guest(room, guest)
    room.guests.delete(guest)
  end

  def add_songs_to_all_rooms(songs)
    rooms.each {|room| room.songs.concat(songs)}
  end
  
  def add_drinks_to_all_bars(drinks)
    @rooms.each {|room| room.bar.drinks.concat(drinks)}
  end
end

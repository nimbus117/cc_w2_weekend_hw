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

  def get_till_report()
    # empty array to hold report hash from each till
    report = []
    # array to hold each till instance, start with KaraokeBar till
    all_tills = [@till]
    # loop through each room and add till to all_tills array
    @rooms.each {|room| all_tills.push(room.bar.till)}
    # loop through each till and push id/money hash to report array
    all_tills.each {|till| report.push({id: till.id, money: till.money})}
    # use reduce on the all_tills array to get total money in all tills
    total = all_tills.reduce(0) {|total, till| total + till.money}
    # push total hash to report array
    report.push({id: 'total', money: total})
    # return report
    p report
    return report
  end
end

class Guest
  attr_reader(:name, :wallet, :fav_song)

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def remove_money(amount)
    @wallet -= amount
  end

  def check_for_fav_song(songs)
    return 'Whoo!' if songs.include?(@fav_song)
  end
end

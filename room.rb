class Room
  attr_reader(:capacity, :guests, :songs, :bar)

  def initialize(bar)
    @capacity = 6
    @guests = []
    @songs = []
    @bar = bar
  end

  def get_song_by_title(title)
    @songs.find {|song| song.title == title}
  end

  def get_songs_by_artist(artist)
    @songs.find_all {|song| song.artist == artist}
  end
end

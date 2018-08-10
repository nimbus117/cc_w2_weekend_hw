require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song = Song.new('Remedy', 'My Baby')
  end
  
  def test_song_has_title
    assert_equal('Remedy', @song.title)
  end

  def test_song_has_artist
    assert_equal('My Baby', @song.artist)
  end
end


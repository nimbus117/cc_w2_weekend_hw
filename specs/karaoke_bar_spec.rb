require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')

class TestKaraokeBar < MiniTest::Test
  def setup
    @karaoke_bar = KaraokeBar.new('CodeClan Caraoke')
  end

  def test_karaoke_bar_has_name
    assert_equal('CodeClan Caraoke', @karaoke_bar.name)
  end
end

require("minitest/autorun")
require('minitest/rg')
require_relative('../player.rb')
require_relative('../word.rb')


class TestWord < MiniTest::Test

  def setup
    @word = Word.new("cat")
    @player = Player.new("Bob")
  end

  def test_game_word
    assert_equal(["c","a","t"], @word.game_word)
  end


end

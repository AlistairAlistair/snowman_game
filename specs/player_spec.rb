require("minitest/autorun")
require('minitest/rg')
require_relative('../player.rb')

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new("Bob")
  end

  def test_player_name
    assert_equal("Bob", @player.name)
  end

  def test_player_lives
    assert_equal(6, @player.lives)
  end

  def test_player_letters
    assert_equal([], @player.letters)
  end

  def test_status
    assert_equal(false, @player.status)
  end



  def test_remove_live
    assert_equal(5, @player.remove_life)
  end

  def test_game_over
    assert_equal("Game Over", @player.game_over)
  end


end

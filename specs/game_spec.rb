require("minitest/autorun")
require('minitest/rg')
require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../word.rb')

class TestGame < MiniTest::Test

def setup
  @word = Word.new("cat")
  @player = Player.new("Bob")
  @game = Game.new(@player, @word)
end

def test_correct_guess_letter
  @game.guess_letter("a")
  assert_equal(["a"], @game.letters)
  assert_equal(6, @player.lives)
end

def test_wrong_guess_letter
  @game.guess_letter("b")
  assert_equal(["b"], @game.letters)
  assert_equal(5, @player.lives)
end

def test_guess_letter_applied_twice
  @game.guess_letter("a")
  @game.guess_letter("b")
  @game.guess_letter("d")

  assert_equal(["a", "b", "d"], @game.letters)
  assert_equal(4, @player.lives)
end

def test_showing_word_a
  @game.guess_letter("a")
  assert_equal("*a*", @game.showing_word)
end

def test_showing_word_b
  @game.guess_letter("b")
  assert_equal("***", @game.showing_word)
end

# def test_showing_word_abc
#   @game.guess_letter("c")
#   @game.guess_letter("a")
#   # @game.guess_letter("t")
#   assert_equal("ca*", @game.showing_word)
#   assert_equal("Well done, the word was cat", @game.guess_letter("t"))
# end




end

require("minitest/autorun")
require('minitest/rg')
require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../word.rb')

class TestGame < MiniTest::Test

def setup
  @word = Word.new("cat")
  @word2 = Word.new("sheep")
  @player = Player.new("Bob")
  @game = Game.new(@player, @word)
  @game2 = Game.new(@player, @word2)
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

def test_showing_word_abc
  @game.guess_letter("a")
  @game.guess_letter("b")
  @game.guess_letter("c")
  @game.guess_letter("d")
  # @game.guess_letter("t")
  assert_equal("ca*", @game.showing_word)
  assert_equal(4, @player.lives)
  assert_equal("Well done", @game.guess_letter("t"))

end

def test_showing_word_abc
  @game2.guess_letter("s")
  @game2.guess_letter("h")
  @game2.guess_letter("e")
  @game2.guess_letter("r")
  # @game.guess_letter("t")
  assert_equal("she**", @game2.showing_word)
  assert_equal(5, @player.lives)
  assert_equal("Well done", @game2.guess_letter("p"))

end






end

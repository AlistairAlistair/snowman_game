require("minitest/autorun")
require('minitest/rg')
require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../word.rb')

class TestGame < MiniTest::Test

def setup
  @word = Word.new("cat")
  @word2 = Word.new("sheep")
  @word3 = Word.new("cat sheep")
  @player = Player.new("Bob")
  @game = Game.new(@player, @word)
  @game2 = Game.new(@player, @word2)
  @game3 = Game.new(@player, @word3)
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

def test_showing_word_c
  @game3.guess_letter("c")
  assert_equal("c** *****", @game3.showing_word)
end

def test_showing_word_abcd
  @game.guess_letter("a")
  @game.guess_letter("b")
  @game.guess_letter("c")
  @game.guess_letter("d")
  # @game.guess_letter("t")
  assert_equal("ca*", @game.showing_word)
  assert_equal(4, @player.lives)
  assert_equal("Well done", @game.guess_letter("t"))

end

def test_showing_word_shep
  @game2.guess_letter("s")
  @game2.guess_letter("h")
  @game2.guess_letter("e")
  @game2.guess_letter("r")
  # @game.guess_letter("t")
  assert_equal("shee*", @game2.showing_word)
  assert_equal(5, @player.lives)
  assert_equal("Well done", @game2.guess_letter("p"))

end

def test_showing_word_abcdef
  @game2.guess_letter("a")
  @game2.guess_letter("b")
  @game2.guess_letter("c")
  @game2.guess_letter("d")
  @game2.guess_letter("e")
  @game2.guess_letter("f")
  #@game2.guess_letter("g")

  # @game.guess_letter("t")
  assert_equal("**ee*", @game2.showing_word)
  assert_equal(1, @player.lives)

  assert_equal("Game Over", @game2.guess_letter("z"))
  #assert_equal("Well done", @game2.guess_letter("p"))

end





end

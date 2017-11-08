class Game

attr_reader :player, :word, :letters, :status

def initialize(player, word)
  @player = player
  @word = word
  @letters = []
  @status = false
end

def guess_letter(letter)
  @letters << letter
  @game.win_game if @word.game_word.subset?(@letters)
  @player.remove_life if !@word.game_word.include?(letter)
end

def showing_word
  showing_word = ""
  for letter in @word.game_word
    if @letters.include?(letter)
      showing_word << letter
    else
      showing_word << "*"
    end
  end
  return showing_word
end

def win_game
  winning_word = @word.game_word.join
  return "Well done, the word was #{winning_word}"
end


def game_over
  return "Game Over"
end


# def showing_word
#   showing_word = ""
#   for letter in @game_word
#     if @player.letters.include?(letter)
#       showing_word << letter
#     else
#       showing_word << "*"
#     end
#   end
# end


end

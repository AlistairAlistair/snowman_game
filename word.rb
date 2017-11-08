class Word
  attr_reader :game_word

  def initialize(game_word)
    @game_word = game_word.split(//)
  end

  # def asterix_word
  #   "*" * game_word.length
  # end


end

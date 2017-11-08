require_relative('./game.rb')
require_relative('./player.rb')
require_relative('./word.rb')

puts "Quiz master: Enter word."
word = gets.chomp
puts `clear`
hidden_word = Word.new(word)

puts "Enter player name:"
name = gets.chomp

player = Player.new(name)

game = Game.new(player, hidden_word)

puts "You have #{player.lives} lives"
puts "Hidden word:"
puts game.showing_word

until word == game.showing_word || player.lives == 0

  puts "Guess a letter:"
  letter = gets.chomp
  puts `clear`
  puts game.guess_letter(letter)

  puts game.showing_word
  # game.game_over if player.lives == 0

  puts "You have #{player.lives} lives"

end

puts "The word was #{word}"

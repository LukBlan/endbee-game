require_relative './services/file_reader'
require_relative './domain/dictionary/dictionary_factory'
require_relative './domain/player'
require_relative './domain/game'
require_relative './ui/console_interface'
require_relative './ui/console_formatter'

file_reader = FileReader.new
dictionary_factory = DictionaryFactory.new(file_reader)
dictionary = dictionary_factory.create("./../dictionary/dictionary.txt")

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")
game = Game.new([player1, player2], dictionary)

console_formatter = ConsoleFormatter.new
console_interface = ConsoleInterface.new(game, console_formatter)
console_interface.init
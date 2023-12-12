require_relative './domain/dictionary/dictionary_factory'
require_relative './domain/player'
require_relative './ui/console_interface'
require_relative './ui/console_formatter'
require_relative './services/file_reader'
require_relative './domain/game/game_factory'


file_reader = FileReader.new
dictionary_factory = DictionaryFactory.new(file_reader)

game_factory = GameFactory.new(dictionary_factory, "./../dictionary/dictionary.txt")

console_formatter = ConsoleFormatter.new
console_interface = ConsoleInterface.new(console_formatter)

console_interface.init(game_factory)
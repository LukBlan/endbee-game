require_relative './../player'
require_relative './game'

class GameFactory
  def initialize(dictionary_factory, dictionary_file)
    @dictionary_factory = dictionary_factory
    @dictionary_file = dictionary_file
  end

  def create(players_names)
    players = self.get_players(players_names)
    dictionary = @dictionary_factory.create(@dictionary_file)
    Game.new(players, dictionary)
  end

  def get_players(players_names)
    players = []

    players_names.each do |player_name|
      players << Player.new(player_name)
    end

    players
  end
end

# frozen_string_literal: true

class Game
  attr_reader :fragment, :players, :game_over_word, :round

  def initialize(players, dictionary)
    @round = 1
    @dictionary = dictionary
    @game_over_word = "GHOST"
    @fragment = []
    @players = players
    @turn_controller = 0
  end

  def current_player
    @players[@turn_controller]
  end

  def increase_round
    @round += 1
  end

  def last_player
    last_turn_position = (@turn_controller - 1) % @players.length
    @players[last_turn_position]
  end

  def add_letter(letter)
    @fragment << letter
  end

  def next_turn
    @turn_controller = (@turn_controller + 1) % @players.length
  end

  def valid_play?(letter)
    word = @fragment.clone << letter
    @dictionary.valid_word(word)
  end

  def round_over?
    @fragment.length >= 3 && @dictionary.have_word?(@fragment)
  end

  def someone_lost
    @players.any? { |player| player.lost_game?(@game_over_word) }
  end

  def reset_fragment
    @fragment = []
  end

  def get_winner
    @players.find { |player| !player.lost_game?(@game_over_word) }
  end
end

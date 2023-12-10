# frozen_string_literal: true

class Game
  def initialize(players, dictionary)
    @dictionary = dictionary
    @fragment = []
    @players = players
    @turn_controller = 0
  end

  def current_player
    @players = @players[@turn_controller]
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
end

class ConsoleInterface
  def initialize(game)
    @game = game
  end

  def init
    puts("Game is starting...")
    self.game_loop
  end

  def game_loop
    self.play_round
  end

  def play_round
    while !@game.round_over?
      player = @game.current_player
      new_letter = get_letter_from_player(player)
      @game.add_letter(new_letter)
      @game.next_turn
    end
  end

  def get_letter_from_player(player)
    loop do
      new_letter = player.get_letter

      if @game.valid_play?(new_letter)
        return new_letter
      end

      puts("Invalid play, try again")
    end
  end
end

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
    player = @game.current_player
    new_letter = nil

    loop do
      new_letter = player.get_letter

      if @game.valid_play?(new_letter)
        break
      end

      puts("Invalid play, try again")
    end

    @game.add_letter(new_letter)
    @game.next_turn
  end
end

class ConsoleInterface
  def initialize(game, console_formatter)
    @game = game
    @console_formatter = console_formatter
  end

  def init
    self.show_init_message
    self.game_loop
  end

  def show_init_message
    puts("-------------------")
    puts(" Welcome to Endbee")
    puts("-------------------")
  end

  def game_loop
    self.play_round
  end

  def play_round
    while !@game.round_over?
      current_fragment_word = @game.fragment
      puts
      @console_formatter.show_fragment_word(current_fragment_word)
      puts
      player = @game.current_player
      self.display_player_turn(player)
      new_letter = get_letter_from_player(player)
      @game.add_letter(new_letter)

      @game.next_turn
    end
  end

  def display_player_turn(player)
    player_name = player.name
    puts("#{player_name} turn: ")
  end

  def get_letter_from_player(player)
    loop do
      new_letter = player.get_letter(@console_formatter)

      if @game.valid_play?(new_letter)
        return new_letter
      end

      @console_formatter.print_formatted_text("Invalid play, try again\n")
    end
  end
end

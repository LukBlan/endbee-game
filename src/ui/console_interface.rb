class ConsoleInterface
  def initialize(game, console_formatter)
    @game = game
    @console_formatter = console_formatter
  end

  def init
    self.show_init_message
    self.game_loop
    self.show_game_result
  end

  def show_game_result
    player = @game.get_winner
    @console_formatter.print_message_between_dashes("GAME OVER")
    @console_formatter.display_center_message("#{player.name} Wins")
  end

  def show_init_message
    @console_formatter.print_message_between_dashes("Welcome to Endbee")
  end

  def game_loop
    while !@game.one_player_standing?
      self.display_game_state
      self.play_round
      player = @game.last_player
      puts
      self.display_result(player)
      puts
      self.compute_round_result(player)
      @game.reset_fragment
    end
  end

  def compute_round_result(player)
    game_over_word = @game.game_over_word
    player.add_letter_to_game_over_word(game_over_word)
    @game.remove_player_if_lost
    @game.increase_round
  end

  def display_result(player)
    player_name = player.name
    fragment = @game.fragment.join
    puts("#{player_name} form word '#{fragment}' and lost the round")
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

  def display_game_state
    puts("-----------------------  Round #{@game.round}  -----------------------")
    puts("Game State: ")
    players = @game.players

    players.each do |player|
      player_name = player.name
      player_game_over_word = player.game_over_word
      @console_formatter.print_indented_message("#{player_name}: #{player_game_over_word}\n")
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

      @console_formatter.print_indented_message("Invalid play, try again\n")
    end
  end
end

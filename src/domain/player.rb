class Player
  attr_reader :name, :game_over_word

  def initialize(name)
    @name = name
    @game_over_word = ""
  end

  def get_letter(formatter)
    letter = nil

    loop do
      formatter.print_indented_message("Add new letter to word: ")
      letter = gets.chomp.downcase

      if valid_letter(letter)
        break
      end

      formatter.print_indented_message("Invalid letter, try again\n")
      puts
    end

    letter
  end

  def valid_letter(letter)
    letter != "" && letter.ord >= 97 && letter.ord <= 122
  end

  def lost_game?(word)
    @game_over_word == word
  end

  def add_letter_to_game_over_word(game_over_word)
    new_letter_position = @game_over_word.length
    @game_over_word << game_over_word[new_letter_position]
  end
end

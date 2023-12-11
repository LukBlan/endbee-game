class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_letter(formatter)
    letter = nil

    loop do
      formatter.print_formatted_text("Add new letter to word: ")
      letter = gets.chomp.downcase

      if valid_letter(letter)
        break
      end

      formatter.print_formatted_text("Invalid letter, try again\n")
      puts
    end

    letter
  end

  def valid_letter(letter)
    letter != "" && letter.ord >= 97 && letter.ord <= 122
  end
end

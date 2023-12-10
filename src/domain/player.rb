class Player
  def initialize
  end

  def get_letter
    print("Add new letter to word: ")
    letter = nil

    loop do
      letter = gets.chomp.downcase

      if valid_letter(letter)
        break
      end

      puts("Invalid letter, try again")
    end

    letter
  end

  def valid_letter(letter)
    ascii_value = letter.ord
    ascii_value >= 97 && ascii_value <= 122
  end
end

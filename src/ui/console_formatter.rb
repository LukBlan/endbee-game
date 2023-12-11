class ConsoleFormatter
  def print_formatted_text(message)
    print("    - #{message}")
  end

  def show_fragment_word(fragment)
    format = "Fragment Word: ["

    fragment.each_with_index do |char, index|
      format += "#{char}"

      if index != fragment.length - 1
        format += ", "
      end
    end

    format += "]"

    puts(format)
  end
end

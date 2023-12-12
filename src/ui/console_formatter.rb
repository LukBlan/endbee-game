class ConsoleFormatter
  CONSOLE_LENGTH = 50

  def print_indented_message(message)
    print("    - #{message}")
  end

  def print_message_between_dashes(message)
    line = self.get_line

    puts(line)
    display_center_message(message)
    puts(line)
  end

  def display_center_message(message)
    center_text = self.center_message_in_console(message)
    puts(center_text)
  end

  def center_message_in_console(message)
    center_message = message
    message_length = message.length
    white_spaces_amount = (CONSOLE_LENGTH / 2) - (message_length / 2)
    white_spaces_amount.times { center_message = " " + center_message}
    center_message
  end

  def get_line
    line = ""
    CONSOLE_LENGTH.times { line += "-" }
    line
  end

  def show_fragment_word(fragment)
    format = "Letters: ["

    fragment.each_with_index do |char, index|
      format += "#{char}"

      if index != fragment.length - 1
        format += ", "
      end
    end

    format += "]"

    display_center_message(format)
  end
end

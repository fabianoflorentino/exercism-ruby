# frozen_string_literal: true

# Diamond class responsible for creating a diamond pattern based on a given letter.
class Diamond
  attr_accessor :letter

  # Generates a diamond pattern for a given letter.
  def self.make_diamond(letter)
    # Return a single 'A' if the input is 'A'.
    return "A\n" if letter == 'A'

    # Instantiate a new Diamond object and generate the diamond pattern.
    new.diamond(letter.upcase).join
  end

  # Generates the lines for the diamond pattern based on the given letter.
  def diamond(letter)
    # Create an array of letters from 'A' to the given letter and back to 'A' excluding it.
    letters = ('A'..letter).to_a + ('A'...letter).to_a.reverse

    # Generate each line of the diamond based on the letters array.
    letters.map do |char|
      spaces = ' ' * max_spaces(letter, char)

      if char == 'A'
        "#{spaces}#{char}#{spaces}\n"
      else
        "#{spaces}#{char}#{' ' * (2 * calc_char(char) - 1)}#{char}#{spaces}\n"
      end
    end
  end

  private

  # Calculates the maximum spaces needed for each line based on the given letter and current character.
  def max_spaces(letter, char)
    calc_char(letter) - calc_char(char)
  end

  # Calculates the distance of a given character from 'A'.
  def calc_char(char)
    (char.ord - 'A'.ord)
  end
end

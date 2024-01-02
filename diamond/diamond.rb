# frozen_string_literal: true

# Write your code for the 'Diamond' exercise in this file. Make the tests in
# `diamond_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/diamond` directory.
class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    diamond(letter.upcase).join
  end

  def self.max_spaces(letter)
    letter.ord - 'A'.ord
  end

  def self.diamond(letter)
    letters = ('A'..letter).to_a + ('A'...letter).to_a.reverse

    letters.map do |char|
      idx = char.ord - 'A'.ord
      spaces = ' ' * (max_spaces(letter) - idx)

      if char == 'A'
        "#{spaces}#{char}#{spaces}\n"
      else
        "#{spaces}#{char}#{' ' * (2 * idx - 1)}#{char}#{spaces}\n"
      end
    end
  end
end

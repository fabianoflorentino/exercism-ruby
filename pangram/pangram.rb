# frozen_string_literal: true

# Write your code for the 'Pangram' exercise in this file. Make the tests in
# `pangram_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/pangram` directory.
class Pangram
  ALPHABET = ('a'..'z').to_a
  private_constant :ALPHABET

  def self.pangram?(sentence)
    ALPHABET.all? { |letter| sentence.downcase.include?(letter) }
  end
end

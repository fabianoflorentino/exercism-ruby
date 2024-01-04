# frozen_string_literal: true

# Write your code for the 'Acronym' exercise in this file. Make the tests in
# `acronym_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/acronym` directory.
class Acronym
  SPECIAL_CHARACTERS = ['!', '@', '#', '$', '%', '^', '&',
                        '*', '(', ')', '_', '+', '-', ',', ' '].freeze

  def self.abbreviate(phrase)
    new_phrase = phrase.dup

    SPECIAL_CHARACTERS.each { |char| new_phrase = new_phrase.gsub(char, ' ') }

    words(new_phrase)
  end

  def self.words(word)
    word_list = word.split(' ')
    word_list.map { |letter| letter[0].upcase }.join
  end
end

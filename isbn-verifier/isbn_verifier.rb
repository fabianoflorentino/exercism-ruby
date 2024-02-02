# frozen_string_literal: true

#
# Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
# `isbn_verifier_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/isbn-verifier` directory.
class IsbnVerifier
  ISBN_LENGTH = 10

  def self.valid?(isbn)
    isbn = format_isbn(isbn)
    valid_size?(isbn) && !invalid_characters?(isbn) && mod11(isbn)
  end

  def self.format_isbn(isbn)
    isbn.gsub(/[-\s]/, '').chars
  end

  def self.mod11(digits)
    digits = digits.map { |digit| digit == 'X' ? 10 : digit.to_i }
    checksum = digits.each_with_index.sum { |digit, index| digit * (ISBN_LENGTH - index) }
    (checksum % 11).zero?
  end

  def self.invalid_characters?(isbn)
    isbn[0...-1].any? { |element| element =~ /\D/ } || isbn[-1] =~ /[^0-9X]/
  end

  def self.valid_size?(isbn)
    isbn.size == ISBN_LENGTH
  end
end

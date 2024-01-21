# frozen_string_literal: true

#
# Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
# `isbn_verifier_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/isbn-verifier` directory.
class IsbnVerifier
  def self.valid?(isbn)
    checksum(isbn)
  end

  def self.checksum(isbn)
    mod11(format_isbn(isbn))
  end

  def self.format_isbn(isbn)
    isbn = isbn.gsub(/[-\s]/, '').chars

    return 1 if validate?(isbn)

    isbn = isbn.map.with_index { |element, index| index == 9 && element == 'X' ? '10' : element }
    isbn.map(&:to_i)
  end

  def self.mod11(digits)
    calc = 0

    10.times { |char| calc += digits[char] * (10 - char) }
    (calc % 11).zero?
  end

  def self.validate?(isbn)
    return 1 unless valid_size?(isbn)

    isbn.any? { |element| element.match?(/[A-WYZa-wyz]/) }
  end

  def self.valid_size?(isbn)
    isbn.size == 10
  end
end

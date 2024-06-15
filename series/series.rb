# frozen_string_literal: true

# Write your code for the 'Series' exercise in this file. Make the tests in
# `series_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/series` directory.

# Series
class Series
  def initialize(digit)
    @digit = digit
  end

  # The slices method takes an integer argument, slice_length, and returns an array of
  # all the slices of the specified length from the digit string. The method first checks
  # if the slice_length is greater than the length of the digit string. If it is, an ArgumentError
  # is raised. Otherwise, the each_cons method is called on the digit string, with the slice_length
  # argument passed to it. This method returns an enumerator that yields each slice of the specified
  # length from the digit string. The map method is then called on this enumerator, and the join method
  # is called on each slice to convert it back to a string. The resulting array of slices is returned.
  def slices(slice_length)
    raise ArgumentError if slice_length > @digit.length

    @digit.chars.each_cons(slice_length).map(&:join)
  end
end

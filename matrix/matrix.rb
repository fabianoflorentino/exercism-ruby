# frozen_string_literal: true

# Write your code for the 'Matrix' exercise in this file. Make the tests in
# `matrix_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/matrix` directory.

# Matrix
class Matrix
  # Initializes a new Matrix instance with the given matrix string
  def initialize(matrix)
    @matrix = matrix
  end

  # Returns the row at the given index
  def row(index)
    # The split_matrix method is called, and the resulting array of rows is assigned
    # to the variable split_matrix.
    split_matrix[index - 1].split.map(&:to_i)
  end

  # Returns the column at the given index
  def column(index)
    # the split_matrix method is called, and the resulting array of rows is
    # assigned to the variable split_matrix. Then, a map method is called on split_matrix,
    # which iterates over each row.

    # Within the block passed to the map method, each row is further processed.
    # The row.split method is called, which splits the row by whitespace characters,
    # resulting in an array of individual elements. The map method is then called on this array,
    # using the &:to_i syntax, which converts each element to an integer.

    # Finally, the [index - 1] indexing operation is performed on the resulting array of integers.
    # This retrieves the element at the specified index - 1 position from each row. The map method
    # collects these elements and returns them as an array.
    split_matrix.map { |row| row.split.map(&:to_i)[index - 1] }
  end

  private

  # The split_matrix method is a private method that splits the matrix string into an array of rows.
  def split_matrix
    @matrix.split("\n")
  end
end

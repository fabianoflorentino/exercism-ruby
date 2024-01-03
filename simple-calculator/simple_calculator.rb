# frozen_string_literal: true

# Simple Calculator
class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  UnsupportedOperation = Class.new(StandardError)

  # Principal method that performs the mathematical operation based on provided operands and operation.
  def self.calculate(first_operand, second_operand, operation)
    raise SimpleCalculator::UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    case operation
    when '+' then addition(first_operand, second_operand)
    when '/' then division(first_operand, second_operand)
    when '*' then multiplication(first_operand, second_operand)
    end
  end

  # Performs addition between two operands and returns a string with the operation and result.
  def self.addition(first_operand, second_operand)
    error?(first_operand, second_operand)

    result = first_operand + second_operand

    "#{first_operand} + #{second_operand} = #{result}"
  end

  # Performs division between two operands and returns a string with the operation and result.
  # Handles the ZeroDivisionError exception and returns an appropriate message if division by zero occurs.
  def self.division(first_operand, second_operand)
    error?(first_operand, second_operand)

    result = first_operand / second_operand

    "#{first_operand} / #{second_operand} = #{result}"
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end

  # Performs multiplication between two operands and returns a string with the operation and result.
  def self.multiplication(first_operand, second_operand)
    error?(first_operand, second_operand)

    result = first_operand * second_operand

    "#{first_operand} * #{second_operand} = #{result}"
  end

  # Helper method to check if operands are strings, raising an error if true.
  def self.error?(first_operand, second_operand)
    raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)
  end
end

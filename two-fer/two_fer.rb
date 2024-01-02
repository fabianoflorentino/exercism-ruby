# frozen_string_literal: true

# Write your code for the 'Two Fer' exercise in this file. Make the tests in
# `two_fer_test.rb` pass.

# Two fer
class TwoFer
  def self.two_fer(name = 'you')
    format('One for %s, one for me.', name)
  end
end

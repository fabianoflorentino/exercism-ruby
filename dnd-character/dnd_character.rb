# frozen_string_literal: true

# The `frozen_string_literal` directive prevents literal strings from being modified.
# This can help improve performance and avoid bugs in immutable strings.

# DnD Character
class DndCharacter
  # Defines a constant for the initial hitpoints.
  INITIAL_HITPOINTS = 10
  # Makes the `INITIAL_HITPOINTS` constant public, allowing access outside the class.
  public_constant :INITIAL_HITPOINTS

  # Defines reader methods to access the character's attributes.
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  # Initialization method to create a new instance of `DndCharacter`.
  def initialize
    # Assigns the character's attributes by calling the `roll` method for each one.
    @strength = roll
    @dexterity = roll
    @constitution = roll
    @intelligence = roll
    @wisdom = roll
    @charisma = roll
    # Calculates the initial hitpoints by calling the `initial_hitpoints` method.
    @hitpoints = initial_hitpoints
  end

  # Class method that calculates the character's constitution modifier.
  def self.modifier(hitpoints)
    # The modifier is calculated by subtracting the initial hitpoints and dividing by 2.
    (hitpoints - INITIAL_HITPOINTS) / 2
  end

  private

  # Private `roll` method that simulates rolling four six-sided dice.
  # Generates four random numbers between 1 and 6, sorts them, drops the lowest
  # and returns the sum of the three highest.
  def roll
    Array.new(4) { rand(1..6) }.sort.drop(1).sum
  end

  # Private `initial_hitpoints` method that calculates the initial hitpoints
  # of the character based on the constitution modifier.
  def initial_hitpoints
    # Adds the initial hitpoints to the constitution modifier.
    INITIAL_HITPOINTS + DndCharacter.modifier(@constitution)
  end
end

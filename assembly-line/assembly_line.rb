# frozen_string_literal: true

# AssemblyLine
class AssemblyLine
  ASSEMBLY_RATE = 221
  # Defines the constant ASSEMBLY_RATE and makes it private so it cannot be
  # accessed outside the class.
  private_constant :ASSEMBLY_RATE

  # Initializes an instance of the class with the provided speed.
  def initialize(speed)
    @speed = speed
  end

  # Calculates the production rate per hour by multiplying the speed by the
  # assembly rate and the success factor.
  def production_rate_per_hour
    (@speed * ASSEMBLY_RATE) * factor_success
  end

  # Calculates the number of working items per minute by dividing the
  # production rate per hour by 60 and rounding down.
  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  private

  # Returns different success factors based on the speed range.
  def factor_success
    return 1.0 if @speed.between?(1, 4)
    return 0.9 if @speed.between?(5, 8)
    return 0.8 if @speed == 9

    # Returns 0.77 if the speed is 10.
    0.77 if @speed == 10
  end
end

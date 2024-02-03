class BirdCount
  LAST_WEEK = [0, 2, 5, 3, 7, 8, 4].freeze
  private_constant :LAST_WEEK

  def self.last_week
    LAST_WEEK
  end

  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday
    @birds_per_day[-2]
  end

  def total
    @birds_per_day.sum
  end

  def busy_days
    @birds_per_day.count { |birds| birds >= 5 }
  end

  def day_without_birds?
    @birds_per_day.any? { |birds| birds.zero? }
  end
end

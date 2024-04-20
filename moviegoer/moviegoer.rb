# frozen_string_literal: true

# Error class for when a non-member tries to claim free popcorn
class NotMovieClubMemberError < RuntimeError
  'You must be a member to claim free popcorn'
end

# Moviegoer class with ticket pricing, age restrictions, and free popcorn
class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age >= 60 ? 10 : 15
  end

  def watch_scary_movie?
    @age > 17
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless @member

    '🍿'
  end
end
